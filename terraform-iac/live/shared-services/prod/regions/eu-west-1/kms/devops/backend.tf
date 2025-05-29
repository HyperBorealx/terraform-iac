terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "shared-services/prod/eu-west-1/kms/devops/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
