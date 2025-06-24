output "vpc_id" {
  description = "The ID of the VPC"
  value = {
    for k, vpc in module.vpcs : k => vpc.vpc_id
  }
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = {
    for k, vpc in module.vpcs : k => vpc.vpc_cidr_block
  }
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = {
    for k, vpc in module.vpcs : k => vpc.public_subnets
  }
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value = {
    for k, vpc in module.vpcs : k => vpc.private_subnets
  }
}

output "database_subnets" {
  description = "List of IDs of intra subnets"
  value = {
    for k, vpc in module.vpcs : k => vpc.database_subnets
  }
}

output "azs" {
  description = "A list of availability zones specified as arguments to this module"
  value = {
    for k, vpc in module.vpcs : k => vpc.azs
  }
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value = {
    for k, vpc in module.vpcs : k => vpc.nat_public_ips
  }
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value = {
    for k, vpc in module.vpcs : k => vpc.public_route_table_ids
  }
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value = {
    for k, vpc in module.vpcs : k => vpc.private_route_table_ids
  }
}

output "transit_gateway_vpc_attachment_ids" {
  description = "IDs of the transit gateway VPC attachments"
  value = {
    for k, attachment in aws_ec2_transit_gateway_vpc_attachment.this : k => attachment.id
  }
}

output "transit_gateway_vpc_attachment_accepter_ids" {
  description = "IDs of the transit gateway VPC attachment accepters"
  value = {
    for k, accepter in aws_ec2_transit_gateway_vpc_attachment_accepter.this : k => accepter.id
  }
}
