buckets = {
  phoenix-internal-prod = {
    bucket                                = "phoenix-internal-prod"
    attach_deny_insecure_transport_policy = false
    tags = {
      "Business Group" = "MEC"
    }
  }
  phoenix-internal-uat = {
    bucket                                = "phoenix-internal-uat"
    attach_deny_insecure_transport_policy = false

    tags = {
      "Business Group" = "MEC"
    }
  }
  phoenix-mec-uat = {
    bucket                                = "phoenix-mec-uat"
    attach_deny_insecure_transport_policy = false
    tags = {
      "Business Group" = "MEC"
    }
  }
  phoenix-prod-dynamic-siteconfig = {
    bucket                                = "phoenix-prod-dynamic-siteconfig"
    attach_deny_insecure_transport_policy = false
    tags = {
      "Business Group" = "MEC"
    }
  }
}
