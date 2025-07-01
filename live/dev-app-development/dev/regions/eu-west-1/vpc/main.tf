module "dev-app" {
  providers = {
    aws     = aws
    aws.tgw = aws.tgw
  }
  source = "../../../../../../_modules/vpc"
  vpcs   = var.vpcs
}

