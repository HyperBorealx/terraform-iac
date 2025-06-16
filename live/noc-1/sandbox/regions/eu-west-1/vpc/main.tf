module "noc-1" {
  providers = { 
    aws = aws
    aws.tgw = aws.tgw
  }
  source = "../../../../../../_modules/vpc"
  vpcs   = var.vpcs
}
