module "s3_buckets" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.9.0"

  for_each = var.buckets

  bucket        = each.value.bucket
  acl           = each.value.acl
  force_destroy = each.value.force_destroy

  versioning                            = each.value.versioning
  lifecycle_rule                        = each.value.lifecycle_rule
  server_side_encryption_configuration  = each.value.server_side_encryption_configuration
  logging                               = each.value.logging
  attach_deny_insecure_transport_policy = each.value.attach_deny_insecure_transport_policy
  attach_policy                         = each.value.attach_policy
  policy                                = each.value.policy
  attach_public_policy                  = each.value.attach_public_policy
  tags                                  = each.value.tags
  cors_rule                             = each.value.cors_rule
  object_ownership                      = each.value.object_ownership
  grant                                 = each.value.grant
}
