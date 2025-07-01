resources = {
  "S95NSP102" = {
    name           = "S95NSP102"
    instance_type  = "t3.large"
    subnet_id  = "subnet-063baa45fd60070a8"
    ami  = "ami-0a727a421bd5a51a3"
    vpc_security_group_ids = ["sg-005c2bc52f60bd609"]

    availability_zone  = "us-east-2a"

    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 3
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        encrypted     = true
        volume_type   = "gp3"
        throughput    = 125
        volume_size   = 100
        tags = {
          "Business Group" = "Infrastructure"
          "Environment" = "production"
          "PIIAccess" = "No"
          "BusinessGroup" = "NOC"
          "PrivacyLevel" = "N/A"
          "Security" = "High"
          "ApplicationGroup" = "NOC"
          "ApplicationName" = "Enterprise CA #3"
          "OS" = "Windows Server 2019"
          "pslbackup" = "psl-daily30days"
          "InstanceName" = "S95NSP102 - Enterprise CA#3"
          "SecurityLevel" = "High"
          "Machine Name" = "S95NSP102 - Enterprise CA#3"
          "Name" = "S95NSP102 - Enterprise CA #3"
          "RI Expiry" = "Not Purchased"
        }
      }
    ]

    aws_ebs_volumes = {
    }

    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "ca-iam-role"

    tags = {
      "LastPatch" = "2022-10-18"
      "OS" = "Windows Server 2019"
      "Application Name" = "Enterprise CA #3"
      "pslbackup" = "psl-daily30days"
      "Security" = "High"
      "ApplicationGroup" = "NOC"
      "InstanceName" = "S95NSP102 - Enterprise CA #3"
      "PIIAccess" = "No"
      "Patch Note" = "Special"
      "DRI" = "Sami Sheikh"
      "Environment" = "production"
      "ApplicationName" = "Enterprise CA #3"
      "PatchGroup" = "NOC Patch"
      "Contact" = ""
      "BusinessGroup" = "NOC"
      "PrivacyLevel" = "N/A"
      "Business Group" = "Infrastructure"
      "Ecosystem" = "Enterprise CA"
      "Machine Name" = "S95NSP102 - Enterprise CA #3"
      "SecurityLevel" = "High"
      "Tester" = ""
      "Name" = "S95NSP102 - Enterprise CA #3"
      "RI Expiry" = "Not Purchased"
    }
  },
  "S95NSP009" = {
    name           = "S95NSP009"
    instance_type  = "t3.large"
    subnet_id  = "subnet-063baa45fd60070a8"
    ami  = "ami-019a4607ba39bfde6"
    vpc_security_group_ids = ["sg-01473f1000596db95", "sg-093e6f75efe6779f7", "sg-005c2bc52f60bd609", "sg-066bf90116a8fc3ae"]

    availability_zone  = "us-east-2a"

    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 3
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        encrypted     = true
        volume_type   = "gp3"
        throughput    = 125
        volume_size   = 100
        tags = {
          "ApplicationName" = "Knowbe4"
          "SecurityLevel" = "Medium"
          "PrivacyLevel" = "N/A"
          "BusinessGroup" = "NOC"
          "Environment" = "production"
          "ApplicationGroup" = "NOC"
          "Name" = "S95NSP009 - DesktopCentral-GAD-SPSS-Knowbe4"
          "Business Group" = "Infrastructure"
          "PIIAccess" = "No"
        }
      }
    ]

    aws_ebs_volumes = {
      xvdf = {
        device_name   = "xvdf"
        volume_type   = "gp3"
        throughput    = 125
        size          = 150
        attach        = true
        tags = {
          "ApplicationName" = "Knowbe4"
          "SecurityLevel" = "Medium"
          "PrivacyLevel" = "N/A"
          "BusinessGroup" = "NOC"
          "Environment" = "production"
          "ApplicationGroup" = "NOC"
          "Name" = "S95NSP009 - DesktopCentral-GAD-SPSS-Knowbe4"
          "Business Group" = "Infrastructure"
          "PIIAccess" = "No"
        }
      },
    }

    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "EC2-SSM-Role"

    tags = {
      "Business Group" = "Infrastructure"
      "Environment" = "production"
      "PIIAccess" = "No"
      "BusinessGroup" = "NOC"
      "PrivacyLevel" = "N/A"
      "PatchGroup" = "NOC Patch"
      "LastPatch" = "2022-10-18"
      "ApplicationGroup" = "NOC"
      "Name" = "S95NSP009 - DesktopCentral-GAD-SPSS-Knowbe4"
      "OS" = "Windows Server 2019"
      "pslbackup" = "psl-daily30days"
      "SecurityLevel" = "Medium"
      "ApplicationName" = "Knowbe4"
      "DRI" = "Guillermo Padilla, CTS"
    }
  },
}
