variable "iam_roles" {
  description = "Map of IAM roles to create with their configurations"
  type = map(object({
    iam_role_description   = optional(string)
    iam_policy_description = optional(string)
  }))
  default = {}
}

module "iam_roles" {
  source        = "../../../../../../_modules/iam-role"
  policies_path = "${path.cwd}/policies"
  iam_roles     = var.iam_roles
}
