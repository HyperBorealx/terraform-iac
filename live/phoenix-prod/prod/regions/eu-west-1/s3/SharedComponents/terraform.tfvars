buckets = {
  mec-phoenix-prod-nid-bucket = {
    bucket                                = "mec-phoenix-prod-nid-bucket"
    attach_deny_insecure_transport_policy = false
    tags = {
      BusinessGroup = "SharedComponents"
      Created       = "Terraform"
      Ticket        = "OPS-54211"
    }
  }
}
