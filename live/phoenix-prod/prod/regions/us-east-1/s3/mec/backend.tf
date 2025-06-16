terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "phoenix-prod/prod/eu-east-1/s3/mec/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
