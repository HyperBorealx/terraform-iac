resource "aws_iam_role_policy" "this" {
  for_each = aws_iam_role.this
  role     = each.value.name
  name     = "inline"
  policy = templatefile("${var.policies_path}/${each.key}/permission.json", {
    region     = var.region,
    account_id = var.account_id
  })
  depends_on = [aws_iam_role.this]
}

resource "aws_iam_role" "this" {
  for_each = var.iam_roles

  name        = each.key
  description = try(each.value.iam_role_description, null)
  assume_role_policy = templatefile("${var.policies_path}/${each.key}/assume.json", {
    region             = var.region,
    eks_oidc_issuer_id = var.eks_oidc_issuer_id
    account_id         = var.account_id
  })
}
