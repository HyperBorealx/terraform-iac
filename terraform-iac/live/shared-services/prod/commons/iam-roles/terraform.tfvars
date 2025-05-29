iam_roles = {
  "atlantisbase" = {
    iam_role_description   = "Role for atlantis"
    iam_policy_description = "Policy for atlantis"
  },
  "atlantisexecution" = {
    iam_role_description   = "Role for Executing Atlantis"
    iam_policy_description = "Policy for Executing Atlantis"
  },
  "external-dns-route53" = {
    iam_role_description   = "Role for external-dns"
    iam_policy_description = "Policy for external-dns"
  }
  "external-secret" = {
    iam_role_description   = "Role for external-secret"
    iam_policy_description = "Policy for external-secret"
  }
}
