variable "instances" {
  description = "map of EC2 to create"
  type = map(object({
    ami                       = string
    instance_type             = string

    availability_zone         = optional(string)
    subnet_id                 = optional(string)
    key_name                  = optional(string)
    private_ip                = optional(string)
    vpc_security_group_ids    = optional(list(string), [])

    cpu_options = optional(object({
      core_count              = number
      threads_per_core        = number
    }))

    tags = optional(map(string), {})
  }))
}
