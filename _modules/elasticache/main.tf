module "elasticache" {
  source   = "terraform-aws-modules/elasticache/aws"
  version  = "1.6.0"
  for_each = var.elasticaches

  create_replication_group = true
  replication_group_id     = each.key
  create_cluster = false

  node_type            = each.value.node_type
  port                 = each.value.port
  parameter_group_name = each.value.parameter_group_name

  apply_immediately  = each.value.apply_immediately
  num_cache_clusters = each.value.num_cache_clusters
  engine_version     = each.value.engine_version

  subnet_group_name          = each.value.subnet_group_name
  security_group_ids         = each.value.security_group_ids
  kms_key_arn                = each.value.kms_key_arn
  create_security_group      = each.value.create_security_group
  create_subnet_group        = each.value.create_subnet_group
  log_delivery_configuration = each.value.log_delivery_configuration
  snapshot_retention_limit   = each.value.snapshot_retention_limit
  tags = merge(each.value.tags, { TerraformTrack = trim(
    replace(
      path.cwd,
      regexall("^.*/live/", path.cwd)[0],
      ""
    ),
    "/"
  ) })
}
