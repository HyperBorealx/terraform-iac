resources = {
  "ElasticCacheBastion" = {
    name                   = "ElasticCacheBastion"
    instance_type          = "t3.small"
    subnet_id              = "subnet-9694d3de"
    ami                    = "ami-0ac67a26390dc374d"
    vpc_security_group_ids = ["sg-8f825ffd"]

    availability_zone = "eu-west-1c"

    root_block_device = [
      {
        delete_on_termination = true
        encrypted   = true
        volume_type = "gp3"
        throughput  = 125
        volume_size = 8
        tags = {
          ApplicationGroup  = "MEC"
          ApplicationName   = ""
          "Business Group"  = "SharedComponents"
          BusinessGroup     = "MEC"
          Environment       = "sandbox"
          Name              = "ElasticCacheBastion"
          PIIAccess         = "No"
          PrivacyLevel      = "N/A"
          SecurityLevel     = "Medium"
        }
      }
    ]

    user_data_replace_on_change = false
    
    timeouts                    = {}
    create_iam_instance_profile = false
    iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"

    tags = {
      ApplicationGroup                 = "MEC"
      ApplicationName                  = ""
      BusinessGroup                    = "MEC"
      DRI                              = "Jeff Rigby"
      Environment                      = "sandbox"
      Name                             = "ElasticCacheBastion"
      PIIAccess                        = "No"
      PrivacyLevel                     = "N/A"
      SecurityLevel                    = "Medium"
    }


  }
}
