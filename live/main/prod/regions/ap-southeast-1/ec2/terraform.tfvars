resources = {
  "s88nsp005" = {
    name           = "s88nsp005"
    instance_type  = "r6i.large"
    subnet_id  = "subnet-0d443ae73ca0e7c32"
    ami  = "ami-021d3879cc5dc0f63"
    vpc_security_group_ids = ["sg-0b27f10978cc127da", "sg-0e45b05ad709b08f1"]

    availability_zone  = "ap-southeast-1a"


    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 3
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        delete_on_termination = false
        encrypted     = true
        iops          = 3000
        throughput    = 125
        size          = 100
        type          = "gp3"
        tags = {
          "PrivacyLevel" = "N/A"
          "ApplicationName" = "FSX SEP endpoint Crawler"
          "BusinessGroup" = "NOC"
          "Name" = "s88nsp005 - FSX SEP endpoint Crawler"
          "SecurityLevel" = "Medium"
          "Business Group" = "Infrastructure"
          "Environment" = "production"
          "ApplicationGroup" = "NOC"
          "PIIAccess" = "No"
        }
      }
    ]


    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "forcepoint-iam-role"

    tags = {
      "Security Level" = "High"
      "SecurityLevel" = "Medium"
      "Business Unit" = "Infrastructure"
      "InstanceName" = "s88nsp005 - FSX endpoint Crawler"
      "Machine Name" = "s88nsp005 - FSX endpoint Crawler"
      "PIIAccess" = "No"
      "Application Name" = "FSX SEP endpoint Crawler"
      "DRI" = "Sami Sheikh"
      "OS" = "Windows Server 2019"
      "Ecosystem" = "FSX crawler"
      "LastPatch" = "2022-11-16"
      "Contact" = "noc@pslgroup.com"
      "psl:Backup" = "psl-critical-daily7days"
      "Name" = "s88nsp005 - FSX SEP endpoint Crawler"
      "PatchGroup" = "NOC Patch"
      "Reserved" = "No"
      "PrivacyLevel" = "N/A"
      "ApplicationGroup" = "NOC"
      "Business Group" = "Infrastructure"
      "Environment" = "production"
      "ApplicationName" = "FSX SEP endpoint Crawler"
      "Tester" = "noc@pslgroup.com"
      "BusinessGroup" = "NOC"
    }
  },
  "s88nsp006" = {
    name           = "s88nsp006"
    instance_type  = "c6i.2xlarge"
    subnet_id  = "subnet-0d443ae73ca0e7c32"
    ami  = "ami-0f2274fe79ad0e3cb"
    vpc_security_group_ids = ["sg-0b84ca5f09908cafa", "sg-0b27f10978cc127da"]

    availability_zone  = "ap-southeast-1a"


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
        size          = 100
        type          = "gp3"
        tags = {
          "ApplicationGroup" = "NOC"
          "ApplicationName" = "Forcepoint Crawler"
          "SecurityLevel" = "Medium"
          "Environment" = "production"
          "PrivacyLevel" = "N/A"
          "BusinessGroup" = "NOC"
          "Business Group" = "Infrastructure"
          "Name" = "s88nsp006 - Forcepoint Crawler"
          "PIIAccess" = "No"
        }
      }
    ]

    aws_ebs_volumes = {
      xvdb = {
        device_name   = "xvdb"
        volume_type   = "gp3"
        throughput    = 125
        size          = 200
        attach        = true
        tags = {
          "ApplicationGroup" = "NOC"
          "ApplicationName" = "Forcepoint Crawler"
          "SecurityLevel" = "Medium"
          "Environment" = "production"
          "PrivacyLevel" = "N/A"
          "BusinessGroup" = "NOC"
          "Business Group" = "Infrastructure"
          "Name" = "s88nsp006 - Forcepoint Crawler"
          "PIIAccess" = "No"
        }
      },
    }

    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "forcepoint-iam-role"

    tags = {
      "PatchGroup" = "NOC Patch"
      "Application Name" = "Forcepoint Crawler"
      "BusinessGroup" = "NOC"
      "LastPatch" = "2022-10-18"
      "PIIAccess" = "No"
      "ApplicationGroup" = "NOC"
      "PrivacyLevel" = "N/A"
      "Environment" = "production"
      "Tester" = "sylvia.stoimenova@pslgroup.com"
      "Business Unit" = "SOC"
      "ApplicationName" = "Forcepoint Crawler"
      "psl:Backup" = "psl-critical-daily7days"
      "Ecosystem" = "Forcepoint"
      "Team" = "Security"
      "DRI" = "Sylvia Stoimenova"
      "SecurityLevel" = "Medium"
      "FalconTag" = "Forcepoint"
      "Business Group" = "Infrastructure"
      "Name" = "s88nsp006 - Forcepoint Crawler"
      "Contact" = "sylvia.stoimenova@pslgroup.com"
      "OS" = "Windows Server 2016"
    }
  },
  "S88DCP001" = {
    name           = "S88DCP001"
    instance_type  = "m6i.large"
    subnet_id  = "subnet-0d443ae73ca0e7c32"
    ami  = "ami-084d1e90e53e65995"
    vpc_security_group_ids = ["sg-0b27f10978cc127da", "sg-003259cc51edb486a", "sg-08c65b90dfe630b65"]

    availability_zone  = "ap-southeast-1a"


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
        size          = 100
        type          = "gp3"
        tags = {
          "ApplicationGroup" = "NOC"
          "Environment" = "production"
          "Name" = "S88DCP001 - DomainController"
          "SecurityLevel" = "Medium"
          "Business Group" = "Infrastructure"
          "PIIAccess" = "No"
          "PrivacyLevel" = "N/A"
          "BusinessGroup" = "NOC"
          "ApplicationName" = "DomainController"
        }
      }
    ]


    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "domain-controller-iam-role"

    tags = {
      "OS" = "Windows Server 2022"
      "PrivacyLevel" = "N/A"
      "Contact" = "noc@pslgroup.com"
      "PatchGroup" = "NOC Patch"
      "Ecosystem" = "Domain Controller"
      "Patch Note" = "Special"
      "ApplicationGroup" = "NOC"
      "Business Group" = "Infrastructure"
      "Environment" = "production"
      "Name" = "S88DCP001 - DomainController"
      "BusinessGroup" = "NOC"
      "Tester" = "noc@pslgroup.com"
      "DRI" = "Sami Sheikh"
      "SecurityLevel" = "Medium"
      "Application Name" = "DomainController"
      "PIIAccess" = "No"
      "LastPatch" = "2022-11-16"
      "ApplicationName" = "DomainController"
    }
  },
  "S88DCP002" = {
    name           = "S88DCP002"
    instance_type  = "m6i.large"
    subnet_id  = "subnet-0b84a998e7b34dd14"
    ami  = "ami-0e0553b1af3329750"
    vpc_security_group_ids = ["sg-0b27f10978cc127da", "sg-003259cc51edb486a", "sg-08c65b90dfe630b65"]

    availability_zone  = "ap-southeast-1b"


    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 1
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        delete_on_termination = true
        encrypted     = true
        iops          = 3000
        throughput    = 125
        size          = 100
        type          = "gp3"
        tags = {
          "Name" = "S88DCP002 - Domain Controller"
          "Environment" = "production"
          "ApplicationGroup" = "NOC"
          "Business Group" = "Infrastructure"
          "PIIAccess" = "No"
          "SecurityLevel" = "Medium"
          "PrivacyLevel" = "N/A"
          "ApplicationName" = "Domain Controller"
          "BusinessGroup" = "NOC"
        }
      }
    ]


    user_data_replace_on_change = false

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "domain-controller-iam-role"

    tags = {
      "Ecosystem" = "Domain Controller"
      "Contact" = "noc@pslgroup.com"
      "PrivacyLevel" = "N/A"
      "Name" = "S88DCP002 - Domain Controller "
      "Environment" = "production"
      "Business Group" = "Infrastructure"
      "PIIAccess" = "No"
      "Patch Note" = "Special"
      "Business Unit" = "Infrastructure"
      "SecurityLevel" = "Medium"
      "Tester" = "noc@pslgroup.com"
      "OS" = "Windows Server 2022"
      "PatchGroup" = "NOC Patch"
      "Application Name" = "Domain Controller"
      "BusinessGroup" = "NOC"
      "LastPatch" = "2022-11-16"
      "DRI" = "Sami Sheikh"
      "ApplicationGroup" = "NOC"
      "ApplicationName" = "Domain Controller"
    }
  },
  "s88app907" = {
    name           = "s88app907"
    instance_type  = "m6i.xlarge"
    subnet_id  = "subnet-0e99156e70f1c89f0"
    ami  = "ami-0bdb551960be22656"
    vpc_security_group_ids = ["sg-0111c32d42464b228"]

    availability_zone  = "ap-southeast-1a"

    launch_template = {
      version                        = "1"
      id                             = "lt-0db9f750f09c45349"
    }

    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 1
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        delete_on_termination = true
        encrypted     = true
        iops          = 3000
        throughput    = 125
        size          = 70
        type          = "gp3"
        tags = {
          "Instance Id" = "i-0a2eed27d0b7e2a70"
          "Business Group" = "Infrastructure"
          "Instance Name" = "s88app907.pslgroup.com"
        }
      }
    ]


    user_data_replace_on_change = false
    user_data = <<EOF
#!/bin/bash -x
yum install -y unzip
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
AWS_INSTANCE_ID=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id`
AWS_REGION=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/region`
ROOT_VOLUME_IDS=$(/usr/local/bin/aws ec2 describe-instances --region $AWS_REGION --instance-id $AWS_INSTANCE_ID --output text --query Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId)
EC2_ROLE_NAME="s88app907-iam-role"
/usr/local/bin/aws ec2 create-tags --resources $ROOT_VOLUME_IDS --region $AWS_REGION --tags Key='Business Group',Value="Infrastructure" Key='Instance Id',Value="$AWS_INSTANCE_ID" Key='Instance Name',Value="s88app907.pslgroup.com"
aws s3 cp s3://psl-goldenami/bootstrap /tmp/bootstrap --recursive
chmod -R 700 /tmp/bootstrap/
/tmp/bootstrap/bootstrap.sh "s88app907" "Infrastructure"
rm -rf /tmp/bootstrap
ASSOCIATION_ID=$(/usr/local/bin/aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values="$AWS_INSTANCE_ID"  --query "IamInstanceProfileAssociations[*].AssociationId" --output text)
/usr/local/bin/aws ec2 replace-iam-instance-profile-association --iam-instance-profile Name="$EC2_ROLE_NAME" --association-id $ASSOCIATION_ID
reboot
  EOF

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "psl-zscaler-role"

    tags = {
      "ApplicationGroup" = "Infrastructure"
      "FalconTag" = "APP"
      "SecurityLevel" = "Medium"
      "Instance Name" = "s88app907 - ZScaler"
      "PrivacyLevel" = "N/A"
      "FalconTag2" = "Internal"
      "OS" = "RedHat 9"
      "psl:Backup2" = "NA"
      "Patch Note" = "Special"
      "prod_backupmonthly" = "Yes"
      "RI Expiry" = "Not purchased"
      "BusinessGroup" = "SOC"
      "DRI" = "Tony Ilorah"
      "Name" = "s88app907.pslgroup.com - ZScaler"
      "Ecosystem" = "ZScaler"
      "Environment" = "production"
      "ApplicationName" = "ZScaler"
      "PatchGroup" = "NOC Patch"
      "Tester" = "tony.ilorah@pslgroup.com"
      "map-migrated" = "d-server-015wyc06ufyzfu"
      "PIIAccess" = "No"
      "Machine Name" = "s88app907 - ZScaler"
      "psl:Backup" = "psl-critical-daily7days"
    }
  },
  "s88app908" = {
    name           = "s88app908"
    instance_type  = "m6i.xlarge"
    subnet_id  = "subnet-0e99156e70f1c89f0"
    ami  = "ami-0bdb551960be22656"
    vpc_security_group_ids = ["sg-0111c32d42464b228"]

    availability_zone  = "ap-southeast-1a"

    launch_template = {
      id                             = "lt-0af0968fb05a1f17e"
      version                        = "1"
    }

    metadata_options = {
      http_endpoint                  = "enabled"
      http_protocol_ipv6             = "disabled"
      http_put_response_hop_limit    = 1
      http_tokens                    = "required"
      instance_metadata_tags         = "disabled"
    }

    root_block_device = [
      {
        delete_on_termination = true
        encrypted     = true
        iops          = 3000
        throughput    = 125
        size          = 70
        type          = "gp3"
        tags = {
          "Business Group" = "Infrastructure"
          "Instance Name" = "s88app908.pslgroup.com"
          "Instance Id" = "i-00301b2ac1e2557c6"
        }
      }
    ]


    user_data_replace_on_change = false
    user_data = <<EOF
#!/bin/bash -x
yum install -y unzip
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
AWS_INSTANCE_ID=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id`
AWS_REGION=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/region`
ROOT_VOLUME_IDS=$(/usr/local/bin/aws ec2 describe-instances --region $AWS_REGION --instance-id $AWS_INSTANCE_ID --output text --query Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId)
EC2_ROLE_NAME="s88app908-iam-role"
/usr/local/bin/aws ec2 create-tags --resources $ROOT_VOLUME_IDS --region $AWS_REGION --tags Key='Business Group',Value="Infrastructure" Key='Instance Id',Value="$AWS_INSTANCE_ID" Key='Instance Name',Value="s88app908.pslgroup.com"
aws s3 cp s3://psl-goldenami/bootstrap /tmp/bootstrap --recursive
chmod -R 700 /tmp/bootstrap/
/tmp/bootstrap/bootstrap.sh "s88app908" "Infrastructure"
rm -rf /tmp/bootstrap
ASSOCIATION_ID=$(/usr/local/bin/aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values="$AWS_INSTANCE_ID"  --query "IamInstanceProfileAssociations[*].AssociationId" --output text)
/usr/local/bin/aws ec2 replace-iam-instance-profile-association --iam-instance-profile Name="$EC2_ROLE_NAME" --association-id $ASSOCIATION_ID
reboot
  EOF

    timeouts = {}
    create_iam_instance_profile = false
    iam_instance_profile = "psl-zscaler-role"

    tags = {
      "FalconTag2" = "Internal"
      "Environment" = "production"
      "Instance Name" = "s88app908 - ZScaler"
      "PatchGroup" = "NOC Patch"
      "Patch Note" = "Special"
      "RI Expiry" = "Not purchased"
      "FalconTag" = "WEB"
      "PrivacyLevel" = "N/A"
      "psl:Backup" = "psl-critical-daily7days"
      "map-migrated" = "d-server-015wyc06ufyzfu"
      "Ecosystem" = "ZScaler"
      "PIIAccess" = "No"
      "ApplicationName" = "ZScaler"
      "prod_backupmonthly" = "Yes"
      "Tester" = "New EC2 instance"
      "DRI" = "Tony Ilorah"
      "BusinessGroup" = "Infrastructure"
      "Machine Name" = "s88app908 - ZScaler"
      "ApplicationGroup" = "Infrastructure"
      "SecurityLevel" = "Medium"
      "Owner" = "yazid.towil@pslgroup.com"
      "psl:Backup2" = "NA"
      "Name" = "s88app908.pslgroup.com - ZScaler"
      "OS" = "RedHat 9"
    }
  },
}
