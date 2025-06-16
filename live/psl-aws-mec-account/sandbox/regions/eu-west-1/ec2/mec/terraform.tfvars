instances = {
  ElasticCacheBastion = {
    ami                         = "ami-0ac67a26390dc374d"
    instance_type               = "t3.small"
    key_name                    = "ElasticCacheKeyPair"
    subnet_id                   = "subnet-9694d3de"
    vpc_security_group_ids      = ["sg-8f825ffd"]
    associate_public_ip_address = true
    availability_zone           = "eu-west-1c"
    ebs_optimized               = true
    iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"
    monitoring                  = false
    private_ip                  = "172.31.28.86"

    credit_specification = {
      cpu_credits = "unlimited"
    }

    capacity_reservation_specification = {
      capacity_reservation_preference = "open"
    }

    cpu_options = {
      core_count       = 1
      threads_per_core = 2
    }

    enclave_options = {
      enabled = false
    }

    maintenance_options = {
      auto_recovery = "default"
    }

    metadata_options = {
      http_endpoint               = "enabled"
      http_protocol_ipv6          = "disabled"
      http_put_response_hop_limit = 2
      http_tokens                 = "required"
      instance_metadata_tags      = "disabled"
    }

    private_dns_name_options = {
      enable_resource_name_dns_a_record    = true
      enable_resource_name_dns_aaaa_record = false
      hostname_type                        = "ip-name"
    }

    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 8
      iops                  = 3000
      throughput            = 125
      encrypted             = true
      delete_on_termination = true
      kms_key_id            = "arn:aws:kms:eu-west-1:744310742069:key/8c21125d-6d39-4b4f-8a15-7186ca0aaf9c"

      tags = {
        Name             = "ElasticCacheBastion"
        ApplicationGroup = "MEC"
        ApplicationName  = ""
        BusinessGroup    = "MEC"
        Environment      = "sandbox"
        PIIAccess        = "No"
        PrivacyLevel     = "N/A"
        SecurityLevel    = "Medium"
      }
    }

    tags = {
      Name             = "ElasticCacheBastion"
      ApplicationGroup = "MEC"
      ApplicationName  = ""
      BusinessGroup    = "MEC"
      DRI              = "Jeff Rigby"
      Environment      = "sandbox"
      PIIAccess        = "No"
      PrivacyLevel     = "N/A"
      SecurityLevel    = "Medium"
    }
  }
}
