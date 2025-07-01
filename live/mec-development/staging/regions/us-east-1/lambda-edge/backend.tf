terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "mec-development/staging/us-east-1/lambda-edge/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}