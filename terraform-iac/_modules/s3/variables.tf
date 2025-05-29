variable "buckets" {
  description = "A map of S3 bucket configurations"
  type = map(object({
    bucket                                = string
    acl                                   = optional(string, null)
    force_destroy                         = optional(bool, false)
    versioning                            = optional(map(any), {})
    server_side_encryption_configuration  = optional(map(any), {})
    kms_key_id                            = optional(string)
    lifecycle_rule                        = optional(any, [])
    logging                               = optional(map(any), {})
    tags                                  = optional(map(string), {})
    attach_deny_insecure_transport_policy = optional(bool, true)
    attach_policy                         = optional(bool, false)
    policy                                = optional(string, null)
    attach_public_policy                  = optional(bool, false)
    cors_rule                             = optional(any, [])
    object_ownership                      = optional(string, "BucketOwnerEnforced")
    grant                                 = optional(any, [])
  }))
}
