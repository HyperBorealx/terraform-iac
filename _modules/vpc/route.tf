data "aws_ec2_transit_gateway" "selected" {
  for_each = var.vpcs
  id       = each.value.transit_gateway_id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  for_each           = local.vpcs_to_attach
  transit_gateway_id = each.value.transit_gateway_id
  vpc_id             = module.vpcs[each.key].vpc_id
  subnet_ids         = each.value.subnet_ids

  tags = merge(
    var.vpcs[each.key].tags,
    { Name = "${each.key}-tgw-attach" }
  )
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  for_each = aws_ec2_transit_gateway_vpc_attachment.this
  provider = aws.tgw

  transit_gateway_attachment_id  = each.value.id
  transit_gateway_route_table_id = var.vpcs[each.key].association_transit_gateway_route_table_id
}

resource "aws_ec2_transit_gateway_route" "per_subnet" {
  for_each = local.tgw_route_defs
  provider = aws.tgw

  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
  transit_gateway_route_table_id = each.value.pan_transit_gateway_route_table_id
  destination_cidr_block         = each.value.destination_cidr_block

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.this]
}

resource "aws_route" "public_to_tgw" {
  for_each = local.public_route_tables

  route_table_id         = each.value.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.aws_ec2_transit_gateway.selected[each.value.vpc_key].id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.this]
}

resource "aws_route" "private_to_tgw" {
  for_each = local.private_route_tables

  route_table_id         = each.value.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.aws_ec2_transit_gateway.selected[each.value.vpc_key].id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.this]
}

resource "aws_route" "database_to_tgw" {
  for_each = local.database_route_tables

  route_table_id         = each.value.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.aws_ec2_transit_gateway.selected[each.value.vpc_key].id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.this]
}
