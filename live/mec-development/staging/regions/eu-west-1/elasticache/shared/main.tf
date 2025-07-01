variable "elasticaches" {
  description = "Map of S3 buckets"
  type        = any
}
module "elasticache" {
  source       = "../../../../../../../_modules/elasticache"
  elasticaches = var.elasticaches
}

output "elasticache_cluster_arns" {
  description = "Map of bucket names to their ARNs"
  value       = module.elasticache.cluster_arns
}
