variable "iam_roles" {
  description = "Map of IAM roles to create with their configurations"
  type = map(object({
    iam_role_description   = optional(string)
    iam_policy_description = optional(string)
  }))
  default = {}
}

module "iam_roles" {
  source = "../../../../../_modules/iam-role"

  region     = "eu-west-1"
  account_id = "300476207176"

  policies_path      = "${path.cwd}/policies"
  eks_oidc_issuer_id = "3FA1E22ABF1AC96DA82B0B0B63FC33C1"
  iam_roles          = var.iam_roles
}
