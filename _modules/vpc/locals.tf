locals {
  public_route_tables = merge([
    for vpc_key, vpc_out in module.vpcs : {
      for idx in range(length(vpc_out.public_route_table_ids)) :
      "${vpc_key}-public-${idx}" => {
        vpc_key        = vpc_key
        route_table_id = vpc_out.public_route_table_ids[idx]
      }
    }
  ]...)

  private_route_tables = merge([
    for vpc_key, vpc_out in module.vpcs : {
      for idx in range(length(vpc_out.private_route_table_ids)) :
      "${vpc_key}-private-${idx}" => {
        vpc_key        = vpc_key
        route_table_id = vpc_out.private_route_table_ids[idx]
      }
    }
  ]...)

  database_route_tables = merge([
    for vpc_key, vpc_out in module.vpcs : {
      for idx in range(length(vpc_out.database_route_table_ids)) :
      "${vpc_key}-database-${idx}" => {
        vpc_key        = vpc_key
        route_table_id = vpc_out.database_route_table_ids[idx]
      }
    }
  ]...)

  all_subnet_ids = {
    for vpc_key in keys(var.vpcs) :
    vpc_key => concat(
      module.vpcs[vpc_key].private_subnets,
    )
  }

  vpcs_to_attach = {
    for vpc_key, cfg in var.vpcs :
    vpc_key => {
      transit_gateway_id = cfg.transit_gateway_id
      subnet_ids         = local.all_subnet_ids[vpc_key]
    }
    if cfg.transit_gateway_id != ""
    && length(local.all_subnet_ids[vpc_key]) > 0
  }

  tgw_route_items = flatten([
    for vpc_key, attach in aws_ec2_transit_gateway_vpc_attachment.this : [
      for cidr in concat(
        var.vpcs[vpc_key].public_subnets,
        var.vpcs[vpc_key].private_subnets,
        var.vpcs[vpc_key].database_subnets,
        ) : {
        key               = "${vpc_key}-${replace(cidr, "/", "-")}"
        attach_id         = attach.id
        cidr              = cidr
        pan_rt_id         = var.vpcs[vpc_key].pan_transit_gateway_route_table_id
        association_rt_id = var.vpcs[vpc_key].association_transit_gateway_route_table_id
      }
    ]
  ])

  tgw_route_defs = {
    for item in local.tgw_route_items :
    item.key => {
      transit_gateway_attachment_id              = item.attach_id
      destination_cidr_block                     = item.cidr
      pan_transit_gateway_route_table_id         = item.pan_rt_id
      association_transit_gateway_route_table_id = item.association_rt_id
    }
  }

  endpoint_maps = [
    for vpc_name, cfg in var.vpcs : {
      for svc in cfg.create_endpoints :
      "${vpc_name}-${svc}" => {
        vpc_name     = vpc_name
        service_name = "com.amazonaws.${cfg.region}.${svc}"
      }
      if contains(["s3", "dynamodb"], svc)
    }
  ]

  endpoint_map = merge(local.endpoint_maps...)
}
