terraform {
  backend "s3" {
    bucket         = "psl-group-central-terraform-state"
    key            = "dev-app-development/dev/regions/eu-west-1/vpc/noc/terraform.tfstate" #pending
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = true
  }
}