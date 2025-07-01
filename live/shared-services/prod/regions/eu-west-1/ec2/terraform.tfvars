resources = {
  "s95nsp006" = {
    name                   = "s95nsp006"
    instance_type          = "t3.large"
    subnet_id              = "subnet-0ebc7ca6ab22ad08f"
    ami                    = "ami-0dccc359c8c8a930d"
    vpc_security_group_ids = ["sg-0749438ced117ca51", "sg-0b3ba6fe3eb95731a", "sg-093bbb8c9c62f7a19", "sg-0a5f4cca8c1a7cf5a"]

    availability_zone = "eu-west-1a"

    metadata_options = {
      http_endpoint               = "enabled"
      http_protocol_ipv6          = "disabled"
      http_put_response_hop_limit = 2
      http_tokens                 = "required"
      instance_metadata_tags      = "disabled"
    }

    root_block_device = [
      {
        encrypted   = true
        volume_type = "gp3"
        throughput  = 125
        volume_size = 60
        tags = {
          "ApplicationGroup" = "NOC"
          "ApplicationName"  = "NOC MISC"
          "Business Group"   = "Infrastructure"
          "BusinessGroup"    = "NOC"
          "Environment"      = "production"
          "Instance Id"      = "i-0717e7ad1bd719352"
          "Instance Name"    = "s80nsp006.pslgroup.com"
          "Name"             = "s95nsp006.pslgroup.com - NOC MISC"
          "PIIAccess"        = "No"
          "PrivacyLevel"     = "N/A"
          "SecurityLevel"    = "Medium"
        }
      }
    ]

    user_data_replace_on_change = false
    user_data = <<-EOF
      #!/bin/bash -x
      yum install -y unzip
      AWS_AVAIL_ZONE=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)
      AWS_REGION="`echo \"$AWS_AVAIL_ZONE\" | sed 's/[a-z]$//'`"
      AWS_INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
      ROOT_VOLUME_IDS=$(/usr/local/bin/aws ec2 describe-instances --region $AWS_REGION --instance-id $AWS_INSTANCE_ID --output text --query Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId)
      EC2_ROLE_NAME="s80nsp006-iam-role"
      /usr/local/bin/aws ec2 create-tags --resources $ROOT_VOLUME_IDS --region $AWS_REGION --tags Key='Business Group',Value="Infrastructure" Key='Instance Id',Value="$AWS_INSTANCE_ID" Key='Instance Name',Value="s80nsp006.pslgroup.com"
      aws s3 cp s3://psl-goldenami/bootstrap /tmp/bootstrap --recursive
      chmod -R 700 /tmp/bootstrap/
      /tmp/bootstrap/bootstrap.sh "s80nsp006"
      rm -rf /tmp/bootstrap
      ASSOCIATION_ID=$(/usr/local/bin/aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values="$AWS_INSTANCE_ID"  --query "IamInstanceProfileAssociations[*].AssociationId" --output text)
      /usr/local/bin/aws ec2 replace-iam-instance-profile-association --iam-instance-profile Name="$EC2_ROLE_NAME" --association-id $ASSOCIATION_ID
    EOF

    timeouts                    = {}
    create_iam_instance_profile = false
    iam_instance_profile        = "s80nsp006-iam-role"

    tags = {
      "Application Name" = "NOC MISC"
      "ApplicationGroup" = "NOC"
      "ApplicationName"  = "NOC MISC"
      "Business Group"   = "Infrastructure"
      "BusinessGroup"    = "NOC"
      "Contact"          = ""
      "DRI"              = "Sami Sheikh"
      "Ecosystem"        = "MISC"
      "Environment"      = "production"
      "Instance Name"    = "s95nsp006 - Palo Alto backups"
      "LastPatch"        = "2022-10-18"
      "Machine Name"     = "s95nsp006 - Palo Alto backups"
      "Name"             = "s95nsp006.pslgroup.com - NOC MISC"
      "OS"               = "RedHat 8"
      "PIIAccess"        = "No"
      "PatchGroup"       = "NOC Patch"
      "PrivacyLevel"     = "N/A"
      "RI Expiry"        = "Not purchased"
      "SecurityLevel"    = "Medium"
      "Tester"           = ""
      "map-migrated"     = "d-server-015wyc06ufyzfu"
      "psl:Backup2"      = "psl-critical-daily30days"
    }
  }
}
