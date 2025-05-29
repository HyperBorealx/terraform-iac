variable "keys" {
  description = "map of KMS keys to create"
  type = map(object({
    description             = string
    enable_key_rotation     = optional(bool, false)
    deletion_window_in_days = optional(number, 30)

    tags = optional(map(string), {})

    aliases = optional(list(string), [])

    allowed_iam_roles = optional(list(string), [])
    allowed_iam_role_patterns = optional(list(string), [])
    key_policy = optional(string, "")
  }))
}
