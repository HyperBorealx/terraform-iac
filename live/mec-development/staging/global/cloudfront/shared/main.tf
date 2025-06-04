variable "distributions" {
  description = "Map of CloudFront distributions to create"
  type        = any
}

module "cloudfront" {
  source = "../../../../../../_modules/cloudfront"
  distributions = var.distributions
}

output "distribution_ids" {
  description = "CloudFront distribution IDs"
  value       = module.cloudfront.distribution_ids
}

output "distribution_domain_names" {
  description = "CloudFront distribution domain names"
  value       = module.cloudfront.distribution_domain_names
}

output "distribution_arns" {
  description = "CloudFront distribution ARNs"
  value       = module.cloudfront.distribution_arns
}

output "distribution_hosted_zone_ids" {
  description = "CloudFront distribution hosted zone IDs"
  value       = module.cloudfront.distribution_hosted_zone_ids
}

output "distribution_status" {
  description = "CloudFront distribution status"
  value       = module.cloudfront.distribution_status
}