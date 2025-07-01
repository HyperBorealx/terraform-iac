resources = {
  "s80nsp010" = {
    name           = "s80nsp010"
    instance_type  = "t4g.nano"
    subnet_id  = "subnet-07c1db5007de439b3"
    ami  = "ami-0f706da0eaaffbaaf"
    vpc_security_group_ids = ["sg-06df226d8ca0e8898"]

    availability_zone  = "eu-west-1b"


    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 3
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        delete_on_termination = true
        encrypted     = true
        iops          = 3000
        throughput    = 125
        size          = 10
        type          = "gp3"
        tags = {
          "ApplicationGroup" = "MEC"
          "ApplicationName" = "bastion"
          "SecurityLevel" = "Medium"
          "PrivacyLevel" = "N/A"
          "Environment" = "production"
          "Name" = "s80nsp010 - neml-prod-bastion"
          "BusinessGroup" = "MEC"
          "Business Group" = "MEC"
          "PIIAccess" = "No"
        }
      }
    ]


    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "EC2-SSM-Role"

    tags = {
      "ApplicationGroup" = "MEC"
      "OS" = "Amazon Linux 2"
      "Contact" = ""
      "Tester" = ""
      "PIIAccess" = "No"
      "Name" = "s80nsp010 - neml-prod-bastion"
      "Business Group" = "MEC"
      "DRI" = "Sylvia Stoimenova"
      "ApplicationName" = "bastion"
      "Ecosystem" = "neml-prod-bastion"
      "PrivacyLevel" = "N/A"
      "PatchGroup" = "NOC Patch"
      "BusinessGroup" = "MEC"
      "Environment" = "production"
      "Application Name" = "neml-prod-bastion"
      "SecurityLevel" = "Medium"
    }
  },
}
