variable "iam_roles" {
  description = "Map of IAM roles to create with their configurations"
  type = map(object({
    iam_role_description   = optional(string)
    iam_policy_description = optional(string)
  }))
  default = {}
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = null
}

variable "eks_oidc_issuer_id" {
  description = "eks_oidc_issuer_id"
  type        = string
  default     = null
}


variable "account_id" {
  description = "AWS account ID"
  type        = string
  default     = null
}

variable "policies_path" {
  description = "Path to directory containing IAM policy JSON files"
  type        = string
  default     = ""
}
