buckets = {
  phoenix-mec-prod-backup = {
    bucket                                = "phoenix-mec-prod-backup"
    attach_deny_insecure_transport_policy = false
    tags = {
      "Business Group" = "MEC"
    }
  }
  phoenix-mec-prod = {
    bucket                                = "phoenix-mec-prod"
    attach_deny_insecure_transport_policy = false
    tags = {
      "Business Group" = "MEC"
    }
  }
}
