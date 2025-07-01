variable "vpcs" {
  description = "Map of VPCs to create with their configurations"
  type = map(object({
    vpc_cidr         = string
    secondary_vpc_cidrs = optional(list(string), [])
    private_subnets  = optional(list(string), [])
    public_subnets   = optional(list(string), [])
    database_subnets = optional(list(string), [])

    create_database_subnet_group       = optional(bool, false)
    create_database_subnet_route_table = optional(bool, false)

    create_elasticache_subnet_group       = optional(bool, false)
    create_elasticache_subnet_route_table = optional(bool, false)

    manage_default_network_acl = optional(bool, false)
    manage_default_route_table = optional(bool, false)
    create_igw                 = optional(bool, false)
    enable_dns_hostnames       = optional(bool, true)
    enable_nat_gateway         = optional(bool, false)

    enable_flow_log                      = optional(bool, true)
    create_flow_log_cloudwatch_iam_role  = optional(bool, true)
    create_flow_log_cloudwatch_log_group = optional(bool, true)
    flow_log_destination_arn             = optional(string, "arn:aws:s3:::psl-vpc-flow-logs-188412536036")
    flow_log_destination_type            = optional(string, "s3")

    manage_default_security_group = optional(bool, false)

    public_subnet_tags  = optional(map(string), { "kubernetes.io/role/elb" = 1 })
    private_subnet_tags = optional(map(string), { "kubernetes.io/role/internal-elb" = 1 })
    tags                = optional(map(string))

    # not part of module
    region                                     = string
    create_endpoints                           = optional(list(string), ["s3"])
    transit_gateway_id                         = optional(string, "tgw-08f09b45996504712")
    association_transit_gateway_route_table_id = optional(string, "tgw-rtb-05978c3d0f79eeb2c")
    pan_transit_gateway_route_table_id         = optional(string, "tgw-rtb-0c12f26443088fdfb")
    auto_accept_shared_attachments             = optional(bool, true)
  }))
}
