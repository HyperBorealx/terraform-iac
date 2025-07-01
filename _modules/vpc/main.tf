module "vpcs" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  for_each = var.vpcs

  name       = each.key
  cidr       = each.value.vpc_cidr
  secondary_cidr_blocks = each.value.secondary_vpc_cidrs
  create_igw = each.value.create_igw

  azs              = ["${each.value.region}a", "${each.value.region}b", "${each.value.region}c"]
  private_subnets  = each.value.private_subnets
  public_subnets   = each.value.public_subnets
  database_subnets = each.value.database_subnets

  enable_dns_hostnames                 = each.value.enable_dns_hostnames
  enable_nat_gateway                   = each.value.enable_nat_gateway
  enable_flow_log                      = each.value.enable_flow_log
  create_flow_log_cloudwatch_iam_role  = each.value.create_flow_log_cloudwatch_iam_role
  create_flow_log_cloudwatch_log_group = each.value.create_flow_log_cloudwatch_log_group
  flow_log_destination_arn             = each.value.flow_log_destination_arn
  flow_log_destination_type            = each.value.flow_log_destination_type

  create_database_subnet_group       = each.value.create_database_subnet_group
  create_database_subnet_route_table = each.value.create_database_subnet_route_table

  manage_default_security_group = each.value.manage_default_security_group
  manage_default_network_acl    = each.value.manage_default_network_acl
  manage_default_route_table    = each.value.manage_default_route_table

  public_subnet_tags  = each.value.public_subnet_tags
  private_subnet_tags = each.value.private_subnet_tags

  tags = merge(each.value.tags, { TerraformTrack = trim(
    replace(
      path.cwd,
      regexall("^.*/live/", path.cwd)[0],
      ""
    ),
    "/"
  ) })
}
