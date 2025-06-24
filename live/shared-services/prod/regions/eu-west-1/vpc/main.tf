module "shared_services_vpc" {
  source = "../../../../../../_modules/vpc"
  providers = {
    aws = aws
    aws.tgw = aws.tgw
  }
  vpcs   = var.vpcs
}
