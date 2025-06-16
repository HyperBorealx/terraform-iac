terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "shared-services/prod/eu-west-1/eks/devops/terraform.tfstate"
    region       = "eu-west-1" # Default to eu-west-1 for state storage
    encrypt      = true
    use_lockfile = true
  }
}
