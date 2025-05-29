variable "iam_roles" {
  description = "Map of IAM roles to create with their configurations"
  type = map(object({
    iam_role_description   = optional(string)
    iam_policy_description = optional(string)
  }))
  default = {}
}

module "iam_roles" {
  source = "../../../../../../_modules/iam-role"

  region     = "eu-west-1"
  account_id = "501723963525"

  policies_path      = "${path.cwd}/policies"
  eks_oidc_issuer_id = "6A186567FBC7B540D2406881E543DB46"
  iam_roles          = var.iam_roles
}
