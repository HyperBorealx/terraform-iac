locals {
  account_aliases = [
    "ss",
    "ss-testing",
    "noc-1",
    "noc-2",
    "prod-cdn-mec",
    "dev-mec",
    "main",
    "phoenix-prod",
    "prod-data-mgmt",
    "leg-mec-sandbox",
    "dev-app",
    "dev-data",
    "dev-data-mgmt",
    "leg-prod-data",
    "prod-amplify-mec",
    "appdev-sandbox",
    "soundboard-sandbox",
    "soundboard-prod",
    "sandbox-data-mgmt"
  ]

  role_accounts = {
    "atlantisbase"      = ["ss"]
    "atlantisexecution" = local.account_aliases
  }

  role_account_pairs = flatten([
    for role, accts in local.role_accounts : [
      for acct in accts : {
        role    = role
        account = acct
      }
    ]
  ])
}
