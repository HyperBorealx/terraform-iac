resources = {
  "s80apd201" = {
    name                   = "s80apd201"
    instance_type          = "t3.large"
    subnet_id              = "subnet-0a3c32e27bc483bd2"
    ami                    = "ami-04facb3ed127a2eb6"
    vpc_security_group_ids = ["sg-01976b493b01f1c17"]

    availability_zone = "eu-west-1a"

    root_block_device = [
      {
        delete_on_termination = false
        encrypted   = true
        volume_type = "gp3"
        throughput  = 125
        volume_size = 80
        tags = {
          "ApplicationName"  = "MEC dev sandbox"
          "Environment"      = "development"
          "PrivacyLevel"     = "N/A"
          "Business Group"   = "SharedComponents"
          "PIIAccess"        = "No"
          "BusinessGroup"    = "MEC"
          "Name"             = "s80apd201 - MEC dev sandbox"
          "SecurityLevel"    = "Medium"
          "ApplicationGroup" = "MEC"
        }
      }
    ]

    user_data_replace_on_change = false
    
    timeouts                    = {}
    create_iam_instance_profile = false
    iam_instance_profile        = "iobranch-dev-iam-role"

    tags = {
      "Application Name"                = ""
      "ApplicationGroup"                = "MEC"
      "ApplicationName"                 = "MEC dev sandbox" 
      "Business Group"                  = "SharedComponents"
      "BusinessGroup"                   = "MEC"
      "CodeDeploy-mec-peerdash-develop" ="on"
      "CodeDeploy-mec-rasweb-develop"  = "on"
      "CodeDeploy-mec-w2c-develop"     = "on"
      "Contact"                         = "mec dev team"
      "Description"                     = "Red Hat"
      "DRI"                             = "Serghei Tiutiun"
      "Ecosystem"                       = "mec dev server"
      "Environment"                     = "development"
      "LastPatch"                       = "2022-11-16"
      "OS"                              = "RedHat 8"
      "PatchGroup"                      = "Staging/Dev"
      "PIIAccess"                       = "No"
      "PrivacyLevel"                    = "N/A"
      "Purchased"                       = "No"
      "RI Expiry"                       = "Not purchased"
      "Security Level"                  = "Low"
      "SecurityLevel"                   = "Medium"
      "Tester"                          = "patricia.lopez@pslgroup.com"
      "Name"                            = "s80apd201 - MEC dev sandbox"
    }

  },
  "s80aps031" = {
    name                   = "s80aps031"
    instance_type          = "t3.large"
    subnet_id              = "subnet-075f89badffbfac9c"
    ami                    = "ami-0ac5e43120ec8d99b"
    vpc_security_group_ids = ["sg-0858888e8e58d1f8c","sg-0a3c905fc50ed04ee"]

    availability_zone = "eu-west-1a"

    root_block_device = [
      {
        delete_on_termination = true
        encrypted             = false
        volume_type           = "gp3"
        throughput            = 125
        volume_size           = 40
        tags = {
          "ApplicationGroup" = "MEC"
          "ApplicationName"  = "Word2Code 2.0, peerdash"
          "Business Group"   = "SharedComponents"
          "BusinessGroup"    = "MEC"
          "Environment"      = "staging"
          "Name"             = "s80aps031"
          "PIIAccess"        = "No"
          "PrivacyLevel"     = "N/A"
          "SecurityLevel"    = "Medium"
        }
      }
    ]

    hibernation                 = false
    user_data_replace_on_change = false
    
    timeouts                    = {}
    create_iam_instance_profile = false
    iam_instance_profile        = "iobranch-staging-iam-role"

    tags = {
      "Application Name"                = "Word2Code 2.0, peerdash"
      "ApplicationName"                 = "Word2Code 2.0, peerdash" 
      "ApplicationGroup"                = "MEC"
      "Business Group"                  = "SharedComponents"
      "BusinessGroup"                   = "MEC"
      "CodeDeploy-mec-peerdash-hotfix" = "on"
      "CodeDeploy-mec-peerdash-staging"= "on"
      "CodeDeploy-mec-rasweb-staging"  = "on"
      "CodeDeploy-mec-w2c-staging"     = "on"
      "Contact"                         = "mykola.prykhodko@pslgroup.com"
      "DRI"                             = "Serghei Tiutiun"
      "Ecosystem"                       = "MEC Channels"
      "Environment"                     = "staging"
      "LastPatch"                       = "2022-11-16"
      "Name"                            = "s80aps031"
      "OS"                              = "RedHat 8"
      "PIIAccess"                       = "No"
      "PatchGroup"                      = "Staging/Dev"
      "PrivacyLevel"                    = "N/A"
      "RI Expiry"                       = "2024-03-26"
      "Reserved"                        = "Yes"
      "Reserved Instance ID"           = "7039b3d5-d699-45f4-ad2d-5d4f1be596fa"
      "SecurityLevel"                   = "Medium"
      "Tester"                          = "patricia.lopez@pslgroup.com"
    }


  }
}
