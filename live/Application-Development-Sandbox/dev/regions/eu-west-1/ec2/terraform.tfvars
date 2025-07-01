resources = {
  "SMTPBlackHole" = {
    name                   = "SMTPBlackHole"
    instance_type          = "t4g.medium"
    subnet_id              = "subnet-1db60b47"
    ami                    = "ami-03643bfca8e100f0d"
    vpc_security_group_ids = ["sg-ee5e599c", "sg-0b2addfaa47e80aa3", "sg-06591ecf53913ff06"]

    availability_zone = "eu-west-1b"

    root_block_device = [
      {
        delete_on_termination = true
        encrypted   = true
        volume_type = "gp3"
        throughput  = 125
        volume_size = 8
        tags = {
          "ApplicationName"  = ""
          "Environment"      = "sandbox"
          "PrivacyLevel"     = "N/A"
          "BusinessGroup"    = "EmailOps"
          "Business Group"   = "EmailOps"
          "PIIAccess"        = "No"
          "Name"             = "SMTPBlackHole"
          "SecurityLevel"    = "Medium"
          "ApplicationGroup" = "EmailOps"
        }
      }
    ]

    user_data_replace_on_change = false
    
    timeouts                    = {}
    create_iam_instance_profile = false
    iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"

    tags = {
      "ApplicationGroup"                = "EmailOps"
      "ApplicationName"                 = ""
      "BusinessGroup"                   = "EmailOps"
      "Business Group"                  = "EmailOps"
      "DRI"                             = "Serghei Tiutiun"
      "Name"                            = "SMTPBlackHole"
      "PatchGroup"                      = "Staging/Dev"
      "PIIAccess"                       = "No"
      "PrivacyLevel"                    = "N/A"
      "SecurityLevel"                   = "Medium"
      Environment                       = "sandbox"
    }


  }
}
