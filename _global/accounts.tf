locals {
  accounts = {
    shared-services = {
      id          = "451063263679"
      role_arn    = "arn:aws:iam::451063263679:role/atlantis-deployment-role"
      external_id = "8a7b6c5d4e3f2g1h0i9j8k7l6m5n4o3p"
      region      = "eu-west-1"
      profile     = "svc-admin" # AWS CLI profile name
    }
  }
}

output "accounts" {
  value = local.accounts
}