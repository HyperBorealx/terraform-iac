buckets = {
  mec-ivcf = {
    bucket                                = "mec-ivcf"
    attach_deny_insecure_transport_policy = false
    tags = {
      BusinessGroup = "MEC"
      GitRepository = "devops-mecops-cdns"
    }
  }
}
