module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  for_each = var.ec2

  name = each.value.name

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  availability_zone      = each.value.availability_zone
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids

  create_eip       = each.value.create_eip
  disable_api_stop = each.value.disable_api_stop
  
  launch_template  = each.value.launch_template

  create_iam_instance_profile = each.value.create_iam_instance_profile
  iam_role_description        = each.value.iam_role_description
  iam_role_policies           = each.value.iam_role_policies
  iam_instance_profile        = each.value.iam_instance_profile
  
  hibernation                 = each.value.hibernation
  user_data                   = each.value.user_data
  user_data_base64            = each.value.user_data_base64
  user_data_replace_on_change = each.value.user_data_replace_on_change
  metadata_options            = each.value.metadata_options
  timeouts                    = each.value.timeouts

  enable_volume_tags = each.value.enable_volume_tags
  root_block_device  = each.value.root_block_device

  ebs_block_device = each.value.ebs_block_device

  tags = each.value.tags

}

resource "aws_volume_attachment" "this" {
  for_each = merge([
    for instance_key, instance in var.ec2 : {
      for volume_key, volume in lookup(instance, "aws_ebs_volumes", {}) :
      "${instance_key}-${volume_key}" => {
        instance_id  = module.ec2[instance_key].id
        device_name  = volume.device_name
        instance_key = instance_key
        volume_key   = volume_key
      }
      if try(volume.attach, false) == true
    }
  ]...)

  instance_id = each.value.instance_id
  device_name = each.value.device_name

  volume_id = aws_ebs_volume.this["${each.value.instance_key}-${each.value.volume_key}"].id
}

resource "aws_ebs_volume" "this" {
  for_each = merge([
    for instance_key, instance in var.ec2 : {
      for volume_key, volume in lookup(instance, "aws_ebs_volumes", {}) :
      "${instance_key}-${volume_key}" => {
        instance_key      = instance_key
        volume_key        = volume_key
        availability_zone = instance.availability_zone
        volume            = volume
      }
      if instance.availability_zone != null
    }
  ]...)

  availability_zone = each.value.availability_zone
  size              = each.value.volume.size
  type              = lookup(each.value.volume, "type", "gp3")
  throughput        = lookup(each.value.volume, "throughput", null)
  iops              = lookup(each.value.volume, "iops", null)
  encrypted         = lookup(each.value.volume, "encrypted", true)
  tags              = lookup(each.value.volume, "tags", {})
}


