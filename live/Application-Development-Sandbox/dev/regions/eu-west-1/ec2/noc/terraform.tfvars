instances = {
  SMTPBlackHole = {
    ami               = "ami-03643bfca8e100f0d"
    instance_type     = "t4g.medium"
    key_name          = "SMTPBlackHole"
    subnet_id         = "subnet-1db60b47"
    availability_zone = "eu-west-1b"
    private_ip        = "172.31.39.43"
    vpc_security_group_ids = [
      "sg-06591ecf53913ff06",
      "sg-0b2addfaa47e80aa3",
      "sg-ee5e599c"
    ]

    cpu_options = {
      core_count       = 2
      threads_per_core = 1
    }

    tags = {
      Name             = "SMTPBlackHole"
      ApplicationGroup = "EmailOps"
      "Business Group" = "EmailOps"
      BusinessGroup    = "EmailOps"
      DRI              = "Serghei Tiutiun"
      Environment      = "sandbox"
      PatchGroup       = "Staging/Dev"
      PIIAccess        = "No"
      PrivacyLevel     = "N/A"
      SecurityLevel    = "Medium"
      ApplicationName  = ""
    }
  }
}
