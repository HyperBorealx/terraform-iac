module "cloudfront_distributions" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "4.0.0"  # Use stable version instead of 4.1.0

  for_each = var.distributions

  aliases                 = each.value.aliases
  comment                 = each.value.comment
  enabled                 = each.value.enabled
  is_ipv6_enabled        = each.value.is_ipv6_enabled
  price_class            = each.value.price_class
  retain_on_delete       = each.value.retain_on_delete
  wait_for_deployment    = each.value.wait_for_deployment

  origin = each.value.origin

  default_cache_behavior = each.value.default_cache_behavior
  ordered_cache_behavior = each.value.ordered_cache_behavior

  custom_error_response = each.value.custom_error_response

  viewer_certificate = each.value.viewer_certificate

  geo_restriction = each.value.geo_restriction

  logging_config = each.value.logging_config

  create_origin_access_control = each.value.create_origin_access_control
  origin_access_control       = each.value.origin_access_control

  create_origin_access_identity = each.value.create_origin_access_identity
  origin_access_identities     = each.value.origin_access_identities

  create_monitoring_subscription           = each.value.create_monitoring_subscription
  realtime_metrics_subscription_status    = each.value.realtime_metrics_subscription_status

  tags = merge(each.value.tags, {
    Module    = "cloudfront"
    ManagedBy = "terraform"
  })
}