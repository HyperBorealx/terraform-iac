resource "aws_vpc_endpoint" "gateway" {
  for_each          = local.endpoint_map
  vpc_id            = module.vpcs[each.value.vpc_name].vpc_id
  service_name      = each.value.service_name
  vpc_endpoint_type = "Gateway"

  route_table_ids = concat(
    module.vpcs[each.value.vpc_name].private_route_table_ids,
    module.vpcs[each.value.vpc_name].database_route_table_ids,
  )

  tags = merge(
    var.vpcs[each.value.vpc_name].tags,
    { Name = each.key }
  )
}