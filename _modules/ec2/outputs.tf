output "instance_ids" {
  description = "Map of logical name - EC2 instance ID"
  value = {
    for name, inst in aws_instance.this :
    name => inst.id
  }
}

output "private_ips" {
  description = "Map of logical name - EC2 private IP address"
  value = {
    for name, inst in aws_instance.this :
    name => inst.private_ip
  }
}

output "public_ips" {
  description = "Map of logical name - EC2 public IP address (if assigned)"
  value = {
    for name, inst in aws_instance.this :
    name => inst.public_ip
  }
}

output "arns" {
  description = "Map of logical name - EC2 instance ARN"
  value = {
    for name, inst in aws_instance.this :
    name => inst.arn
  }
}

output "availability_zones" {
  description = "Map of logical name - availability zone"
  value = {
    for name, inst in aws_instance.this :
    name => inst.availability_zone
  }
}
