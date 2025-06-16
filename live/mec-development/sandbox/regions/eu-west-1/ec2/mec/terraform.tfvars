instances = {
  "s80apd201-MEC-dev-sandbox" = {
    ami                         = "ami-04facb3ed127a2eb6"
    instance_type               = "t3.large"
    key_name                    = "amz-linux-mec-dev"
    subnet_id                   = "subnet-0a3c32e27bc483bd2"
    vpc_security_group_ids      = ["sg-01976b493b01f1c17"]
    associate_public_ip_address = false
    availability_zone           = "eu-west-1a"
    private_ip                  = "10.80.8.106"
    ebs_optimized               = true
    monitoring                  = false
    iam_instance_profile        = "iobranch-dev-iam-role"

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
      http_put_response_hop_limit = 3
      http_tokens                 = "required"
      instance_metadata_tags      = "disabled"
    }

    private_dns_name_options = {
      enable_resource_name_dns_a_record    = false
      enable_resource_name_dns_aaaa_record = false
      hostname_type                        = null
    }

    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 80
      iops                  = 3000
      throughput            = 125
      encrypted             = true
      delete_on_termination = false
      kms_key_id            = "arn:aws:kms:eu-west-1:205551755912:key/4b166b86-b5d7-474c-b4a9-76fb061a4371"

      tags = {
        Name             = "s80apd201 - MEC dev sandbox"
        ApplicationGroup = "MEC"
        ApplicationName  = "MEC dev sandbox"
        "Business Group" = "SharedComponents"
        BusinessGroup    = "MEC"
        Environment      = "development"
        PIIAccess        = "No"
        PrivacyLevel     = "N/A"
        SecurityLevel    = "Medium"
      }
    }

    tags = {
      Name                            = "s80apd201 - MEC dev sandbox"
      ApplicationGroup                = "MEC"
      "Application Name"              = ""
      ApplicationName                 = "MEC dev sandbox"
      "Business Group"                = "SharedComponents"
      BusinessGroup                   = "MEC"
      CodeDeploy-mec-peerdash-develop = "on"
      CodeDeploy-mec-rasweb-develop   = "on"
      CodeDeploy-mec-w2c-develop      = "on"
      Contact                         = "mec dev team"
      DRI                             = "Serghei Tiutiun"
      Description                     = "Red Hat"
      Ecosystem                       = "mec dev server"
      Environment                     = "development"
      LastPatch                       = "2022-11-16"
      OS                              = "RedHat 8"
      PIIAccess                       = "No"
      PatchGroup                      = "Staging/Dev"
      PrivacyLevel                    = "N/A"
      Purchased                       = "No"
      "RI Expiry"                     = "Not purchased"
      "Security Level"                = "Low"
      SecurityLevel                   = "Medium"
      Tester                          = "patricia.lopez@pslgroup.com"
    }
  }

  s80aps031 = {
    ami                         = "ami-0ac5e43120ec8d99b"
    instance_type               = "t3.large"
    key_name                    = "amz-linux-mec-dev"
    subnet_id                   = "subnet-075f89badffbfac9c"
    vpc_security_group_ids      = [
      "sg-0858888e8e58d1f8c",
      "sg-0a3c905fc50ed04ee"
    ]
    associate_public_ip_address = false
    availability_zone           = "eu-west-1a"
    private_ip                  = "10.80.10.224"
    ebs_optimized               = true
    monitoring                  = false
    iam_instance_profile        = "iobranch-staging-iam-role"

    credit_specification = {
      cpu_credits = "standard"
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
      http_put_response_hop_limit = 3
      http_tokens                 = "required"
      instance_metadata_tags      = "disabled"
    }

    private_dns_name_options = {
      enable_resource_name_dns_a_record    = false
      enable_resource_name_dns_aaaa_record = false
      hostname_type                        = null
    }

    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 40
      iops                  = 3000
      throughput            = 125
      encrypted             = false
      delete_on_termination = true
      tags = {
        Name             = "s80aps031"
        ApplicationGroup = "MEC"
        ApplicationName  = "Word2Code 2.0, peerdash"
        "Business Group" = "SharedComponents"
        BusinessGroup    = "MEC"
        Environment      = "staging"
        PIIAccess        = "No"
        PrivacyLevel     = "N/A"
        SecurityLevel    = "Medium"
      }
    }

    tags = {
      Name                             = "s80aps031"
      "Application Name"               = "Word2Code 2.0, peerdash"
      ApplicationGroup                 = "MEC"
      ApplicationName                  = "Word2Code 2.0, peerdash"
      "Business Group"                 = "SharedComponents"
      BusinessGroup                    = "MEC"
      CodeDeploy-mec-peerdash-hotfix  = "on"
      CodeDeploy-mec-peerdash-staging = "on"
      CodeDeploy-mec-rasweb-staging   = "on"
      CodeDeploy-mec-w2c-staging      = "on"
      Contact                          = "mykola.prykhodko@pslgroup.com"
      DRI                              = "Serghei Tiutiun"
      Ecosystem                        = "MEC Channels"
      Environment                      = "staging"
      LastPatch                        = "2022-11-16"
      OS                               = "RedHat 8"
      PIIAccess                        = "No"
      PatchGroup                       = "Staging/Dev"
      PrivacyLevel                     = "N/A"
      "RI Expiry"                      = "2024-03-26"
      Reserved                         = "Yes"
      "Reserved Instance ID"           = "7039b3d5-d699-45f4-ad2d-5d4f1be596fa"
      SecurityLevel                    = "Medium"
      Tester                           = "patricia.lopez@pslgroup.com"
    }
  }
}
