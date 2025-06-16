terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "mec-development/nonprod/eu-west-1/s3/phoenix/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
