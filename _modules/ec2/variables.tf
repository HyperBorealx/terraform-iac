variable "ec2" {
  description = "Map of ec2 to create"
  type = map(object({
    name                   = string
    ami                    = string
    instance_type          = string
    availability_zone      = optional(string, null)
    subnet_id              = string
    vpc_security_group_ids = optional(list(string), [])

    create_eip              = optional(bool, false)
    disable_api_stop        = optional(bool, false)
    disable_api_termination = optional(bool, false)

    launch_template  = optional(map(string), {})

    create_iam_instance_profile = optional(bool, false)
    iam_role_description        = optional(string)
    iam_role_name               = optional(string)
    iam_role_policies           = optional(map(string), {})
    iam_role_tags               = optional(map(string), {})
    iam_instance_profile        = optional(string)
    timeouts                    = optional(map(string), {})

    instance_tags = optional(map(string), {})
    key_name      = optional(string)

    hibernation          = optional(bool, null)
    user_data            = optional(string, null)
    user_data_base64     = optional(string, null)
    user_data_replace_on_change = optional(bool, null)

    metadata_options = optional(map(string), {})

    enable_volume_tags = optional(bool, false)
    volume_tags        = optional(map(string), {})
    root_block_device  = any
    ebs_block_device   = optional(list(any), [])

    tags = optional(map(string), {})

    aws_ebs_volumes = optional(map(object({
      device_name = string
      size        = number
      type        = optional(string, "gp3")
      throughput  = optional(number)
      iops        = optional(number)
      encrypted   = optional(bool, true)
      tags        = optional(map(string), {})
      attach      = optional(bool, false) 
    })), {})

    aws_volume_attachments = optional(map(object({
      device_name = string
      volume_id   = string
    })), {})

  }))
}
