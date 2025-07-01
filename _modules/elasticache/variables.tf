variable "elasticaches" {
  description = "Map of ElastiCache configurations"
  type = map(object({
    description                = optional(string, "")
    apply_immediately          = bool
    node_type                  = string
    port                       = number
    parameter_group_name       = string
    num_cache_clusters         = number
    engine_version             = string
    subnet_group_name          = optional(string)
    security_group_ids         = optional(list(string))
    kms_key_arn                = optional(string, null)
    create_security_group      = optional(bool, false)
    create_subnet_group        = optional(bool, false)
    log_delivery_configuration = optional(any, {})
    tags                       = optional(map(string), {})
    snapshot_retention_limit   = optional(number, null)
  }))
  default = {}
}
