module "cloudfront_distributions" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "4.1.0"

  for_each = var.distributions
  aliases                         = try(each.value.aliases, [])
  comment                         = try(each.value.comment, "")
  continuous_deployment_policy_id = try(each.value.continuous_deployment_policy_id, null)
  default_root_object             = try(each.value.default_root_object, null)
  enabled                         = try(each.value.enabled, true)
  http_version                    = try(each.value.http_version, "http2")
  is_ipv6_enabled                 = try(each.value.is_ipv6_enabled, true)
  price_class                     = try(each.value.price_class, "PriceClass_100")
  retain_on_delete                = try(each.value.retain_on_delete, false)
  staging                         = try(each.value.staging, false)
  wait_for_deployment             = try(each.value.wait_for_deployment, false)
  web_acl_id                      = try(each.value.web_acl_id, null)

  # Origins and cache behaviors
  origin                 = each.value.origin
  origin_group           = try(each.value.origin_group, {})
  default_cache_behavior = each.value.default_cache_behavior
  ordered_cache_behavior = try(each.value.ordered_cache_behavior, [])

  # Error handling and restrictions
  custom_error_response = try(length(each.value.custom_error_response) > 0 ? each.value.custom_error_response : {}, {})
  viewer_certificate    = each.value.viewer_certificate
  geo_restriction       = try(each.value.geo_restriction, { restriction_type = "none", locations = [] })
  logging_config        = try(each.value.logging_config, {})

  # Origin Access Control (OAC)
  create_origin_access_control = try(each.value.create_origin_access_control, false)
  origin_access_control       = try(each.value.origin_access_control, {})

  # Origin Access Identity (OAI) - Legacy approach
  create_origin_access_identity = try(each.value.create_origin_access_identity, false)
  origin_access_identities     = try(each.value.origin_access_identities, {})

  # VPC Origins
  create_vpc_origin = try(each.value.create_vpc_origin, false)
  vpc_origin       = try(each.value.vpc_origin, {})

  # Monitoring
  create_monitoring_subscription           = try(each.value.create_monitoring_subscription, false)
  realtime_metrics_subscription_status    = try(each.value.realtime_metrics_subscription_status, "Enabled")

  # Tags
  tags = merge(each.value.tags, { TerraformTrack = trim(
      replace(
      path.cwd,
      regexall("^.*/live/", path.cwd)[0],
      ""),
      "/"
      ) })
}