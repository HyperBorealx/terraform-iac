moved {
  from = module.shared_services_prod
  to   = module.eks_shared_services_prod
}

module "eks_shared_services_prod" {
  source = "../../../../../../_modules/static-secrets"

  environment           = "prod"
  environment_shortname = "prod"
  project               = "shared-services"
  region                = "eu-west-1"
  file                  = "secrets.yaml"

  tags = {
    ResourceType = "EKS"
    Name         = "shared-services-prod"
  }
}
