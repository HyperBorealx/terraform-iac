variable "instances" {
  description = "Map of EC2 instances to create"
  type        = any
}

module "ec2_instances" {
  source    = "../../../../../../../_modules/ec2"
  instances = var.instances
}

output "instance_ids" {
  description = "Map of EC2 instance names - IDs"
  value       = module.ec2_instances.instance_ids
}

output "private_ips" {
  description = "Map of EC2 instance names - private IPs"
  value       = module.ec2_instances.private_ips
}

output "public_ips" {
  description = "Map of EC2 instance names - public IPs"
  value       = module.ec2_instances.public_ips
}

output "arns" {
  description = "Map of EC2 instance names - ARNs"
  value       = module.ec2_instances.arns
}
