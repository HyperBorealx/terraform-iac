terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "noc-1/sandbox/eu-west-1/vpc/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
