output "key_ids" {
  description = "Map of logical key name → KMS Key ID"
  value = {
    for key_name, kms in aws_kms_key.this :
    key_name => kms.key_id
  }
}

output "key_arns" {
  description = "Map of logical key name → KMS Key ARN"
  value = {
    for key_name, kms in aws_kms_key.this :
    key_name => kms.arn
  }
}

output "aliases" {
  description = "Map of logical key name → list of alias names"
  value       = local.alias_map
}
