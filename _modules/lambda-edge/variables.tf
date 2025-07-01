variable "functions" {
  description = "Map of Lambda@Edge functions to create"
  type = map(object({
    function_name = string
    description   = optional(string, "Lambda@Edge function")
    runtime      = string
    handler      = string
    source_dir   = string
    memory_size  = optional(number, 128)
    timeout      = optional(number, 5)
    event_type   = string # viewer-request, viewer-response, origin-request, origin-response
    tags         = optional(map(string), {})

    # IAM Role configuration
    create_role          = optional(bool, true)
    lambda_role          = optional(string, null)  # Existing role ARN/name when create_role = false
    role_name            = optional(string, null)  # Custom role name when create_role = true
    attach_policy_json   = optional(bool, false)
    policy_json          = optional(string, null)

    # Concurrency configuration
    reserved_concurrent_executions = optional(number, -1)  # -1 = unlimited, 1+ = limited
  }))

  validation {
    condition = alltrue([
      for k, v in var.functions : v.timeout <= 30
    ])
    error_message = "Lambda@Edge timeout cannot exceed 30 seconds."
  }

  validation {
    condition = alltrue([
      for k, v in var.functions : v.memory_size <= 3008
    ])
    error_message = "Lambda@Edge memory cannot exceed 3008 MB."
  }

  validation {
    condition = alltrue([
      for k, v in var.functions : contains([
        "viewer-request",
        "viewer-response",
        "origin-request",
        "origin-response"
      ], v.event_type)
    ])
    error_message = "Invalid event_type. Must be one of: viewer-request, viewer-response, origin-request, origin-response."
  }
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 14
}