variable "buckets" {
  description = "Map of S3 buckets"
  type        = any
}
module "s3" {
  source = "../../../../../../../_modules/s3"
  buckets = var.buckets
}

output "s3_bucket_arns" {
  description = "Map of bucket names to their ARNs"
  value       = module.s3.s3_bucket_arns
}
