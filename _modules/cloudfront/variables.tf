variable "distributions" {
  description = "Map of CloudFront distributions to create"
  type        = any
  default     = {}

  validation {
    condition = alltrue([
      for dist_name, dist_config in var.distributions :
      can(dist_config.origin) && can(dist_config.default_cache_behavior)
    ])
    error_message = "Each distribution must have 'origin' and 'default_cache_behavior' defined."
  }
}