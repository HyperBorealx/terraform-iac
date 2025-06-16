terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "mec-development/staging/eu-west-1/s3/SharedComponents/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
