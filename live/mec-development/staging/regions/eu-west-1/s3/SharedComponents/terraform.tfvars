buckets = {
  phoenix-internal-staging = {
    bucket                                = "phoenix-internal-staging"
    attach_deny_insecure_transport_policy = false
  }
  mec-phoenix-nonprod-nid-bucket = {
    bucket                                = "mec-phoenix-nonprod-nid-bucket"
    attach_deny_insecure_transport_policy = false
    tags = {
      BusinessGroup = "SharedComponents"
      Owner         = "DevOps"
      DRI           = "DevOps"
      Environment   = "Staging"
      ComputeType   = "S3"
      SLALevel      = "Tier3"
      Ticket        = "OPS-54211"
    }
    versioning = {
      enabled = true
    }
    server_side_encryption_configuration = {
      rule = {
        apply_server_side_encryption_by_default = {
          sse_algorithm = "AES256" # This enables SSE-S3 (Amazon S3 managed keys)
        }
        bucket_key_enabled = false # This enables the S3 Bucket Key feature
      }
    }
  }
}
