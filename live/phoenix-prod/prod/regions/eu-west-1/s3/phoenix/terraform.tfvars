buckets = {
  mec-phoenix-prod-cdn-bucket = {
    bucket                                = "mec-phoenix-prod-cdn-bucket"
    attach_deny_insecure_transport_policy = false
    tags = {
      "Business Group" = "MEC"
    }
  }
}
