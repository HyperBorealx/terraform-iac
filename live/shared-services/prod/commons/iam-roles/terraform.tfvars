iam_roles = {
  "external-dns-route53" = {
    iam_role_description   = "Role for external-dns"
    iam_policy_description = "Policy for external-dns"
  }
  "external-secret" = {
    iam_role_description   = "Role for external-secret"
    iam_policy_description = "Policy for external-secret"
  }
}
