output "distribution_ids" {
  description = "Map of distribution names to their IDs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_id
  }
}

output "distribution_arns" {
  description = "Map of distribution names to their ARNs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_arn
  }
}

output "distribution_domain_names" {
  description = "Map of distribution names to their CloudFront domain names"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_domain_name
  }
}

output "distribution_hosted_zone_ids" {
  description = "Map of distribution names to their hosted zone IDs (for Route53 alias records)"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_hosted_zone_id
  }
}

output "distribution_status" {
  description = "Map of distribution names to their deployment status"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_status
  }
}

output "distribution_etags" {
  description = "Map of distribution names to their current ETags"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_etag
  }
}

output "distribution_last_modified_time" {
  description = "Map of distribution names to their last modified times"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_last_modified_time
  }
}

output "distribution_caller_reference" {
  description = "Map of distribution names to their caller references"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_caller_reference
  }
}

output "distribution_in_progress_validation_batches" {
  description = "Map of distribution names to their in-progress validation batches"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_in_progress_validation_batches
  }
}

output "distribution_trusted_signers" {
  description = "Map of distribution names to their trusted signers"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_trusted_signers
  }
}

output "distribution_tags" {
  description = "Map of distribution names to their tags"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_distribution_tags
  }
}

# Origin Access Control outputs
output "origin_access_controls" {
  description = "Map of distribution names to their origin access controls"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_origin_access_controls
  }
}

output "origin_access_control_ids" {
  description = "Map of distribution names to their origin access control IDs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_origin_access_controls_ids
  }
}

# Origin Access Identity outputs
output "origin_access_identities" {
  description = "Map of distribution names to their origin access identities"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_origin_access_identities
  }
}

output "origin_access_identity_ids" {
  description = "Map of distribution names to their origin access identity IDs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_origin_access_identity_ids
  }
}

output "origin_access_identity_iam_arns" {
  description = "Map of distribution names to their origin access identity IAM ARNs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_origin_access_identity_iam_arns
  }
}

# VPC Origin outputs
output "vpc_origin_ids" {
  description = "Map of distribution names to their VPC origin IDs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_vpc_origin_ids
  }
}

# Monitoring outputs
output "monitoring_subscription_ids" {
  description = "Map of distribution names to their monitoring subscription IDs"
  value = {
    for k, dist in module.cloudfront_distributions : k => dist.cloudfront_monitoring_subscription_id
  }
}