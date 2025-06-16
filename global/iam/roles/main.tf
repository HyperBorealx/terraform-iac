data "aws_caller_identity" "ss" {
  provider = aws.ss
}

module "base_ss" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.ss }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisbase = var.iam_roles.atlantisbase
  }
  policies_path      = "${path.cwd}/policies"
  eks_oidc_issuer_id = "3FA1E22ABF1AC96DA82B0B0B63FC33C1"
}

# execution

module "provisioner_ss" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.ss }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_ss-testing" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.ss-testing }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_noc-1" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.noc-1 }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_noc-2" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.noc-2 }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_prod-cdn-mec" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.prod-cdn-mec }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_dev-mec" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.dev-mec }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_main" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.main }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_phoenix-prod" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.phoenix-prod }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}


module "provisioner_prod-data-mgmt" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.prod-data-mgmt }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_leg-mec-sandbox" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.leg-mec-sandbox }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_dev-app" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.dev-app }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_dev-data" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.dev-data }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_dev-data-mgmt" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.dev-data-mgmt }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_leg-prod-data" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.leg-prod-data }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_prod-amplify-mec" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.prod-amplify-mec }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_appdev-sandbox" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.appdev-sandbox }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_soundboard-sandbox" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.soundboard-sandbox }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_soundboard-prod" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.soundboard-prod }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}

module "provisioner_sandbox-data-mgmt" {
  source     = "../../../_modules/iam-role"
  providers  = { aws = aws.sandbox-data-mgmt }
  region     = "eu-west-1"
  account_id = data.aws_caller_identity.ss.account_id
  iam_roles = {
    atlantisexecution = var.iam_roles.atlantisexecution
  }
  policies_path = "${path.cwd}/policies"
}
