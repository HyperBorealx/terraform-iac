terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "global/iam/roles/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
