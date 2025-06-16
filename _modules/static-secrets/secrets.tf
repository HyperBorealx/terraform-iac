data "sops_file" "secrets" {
  source_file = var.file
}

locals {
  secrets = yamldecode(data.sops_file.secrets.raw)
}

resource "aws_secretsmanager_secret" "secret" {
  for_each = nonsensitive(local.secrets)
  name     = "${var.project}/application-static-secrets/${each.key}"
  tags = merge(var.tags, {
    TerraformTrack = trim(
      replace(
        path.cwd,
        regexall("^.*/live/", path.cwd)[0],
        ""
      ),
      "/"
    )
  })
}

resource "aws_secretsmanager_secret_version" "secrets" {
  for_each      = nonsensitive(local.secrets)
  secret_id     = aws_secretsmanager_secret.secret[each.key].id
  secret_string = jsonencode(each.value)
}

resource "aws_secretsmanager_secret_policy" "policy" {
  for_each = {
    for key, secret in aws_secretsmanager_secret.secret : key => secret
    if contains(keys(var.secret_policy_map), key)
  }

  secret_arn = each.value.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowAccessForPrincipals"
        Effect = "Allow"
        Principal = {
          AWS = var.secret_policy_map[each.key].principals
        }
        Action   = var.secret_policy_map[each.key].actions
        Resource = [each.value.arn]
      }
    ]
  })
}
