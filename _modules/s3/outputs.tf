output "s3_bucket_ids" {
  description = "Map of bucket names to their IDs"
  value = {
    for k, bucket in module.s3_buckets : k => bucket.s3_bucket_id
  }
}

output "s3_bucket_arns" {
  description = "Map of bucket names to their ARNs"
  value = {
    for k, bucket in module.s3_buckets : k => bucket.s3_bucket_arn
  }
}
