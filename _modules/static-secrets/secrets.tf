data "sops_file" "secrets" {
  source_file = var.file
}

locals {
  # populates `local.secrets` with subkeys of `secrets` in the secret file
  secrets = yamldecode(data.sops_file.secrets.raw)
}

resource "aws_secretsmanager_secret" "secret" {
  for_each = nonsensitive(local.secrets)
  name     = "${var.project}/application-static-secrets/${each.key}"
}

resource "aws_secretsmanager_secret_version" "secrets" {
  for_each      = nonsensitive(local.secrets)
  secret_id     = aws_secretsmanager_secret.secret[each.key].id
  secret_string = jsonencode(each.value)
}
