# Call the VPC module directly
module "shared_services_vpc" {
  source = "../../../../../../../_modules/vpc"

  name     = "shared-services-dev"
  vpc_cidr = "10.2.0.0/20"
  region   = "eu-west-1"

  # Pass other variables directly
  tags = {
    Owner       = "DevOps"
    DRI         = "DevOps"
    Environment = "Production"
    ComputeType = "VPC"
    SLALevel    = "Tier1"
  }
}
