module "shared_services_vpc" {
  source = "../../../../../../../_modules/vpc"
  vpcs   = var.vpcs
}
