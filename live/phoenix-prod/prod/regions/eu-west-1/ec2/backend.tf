terraform {
  backend "s3" {
    bucket       = "psl-group-central-terraform-state"
    key          = "phoenix-prod/prod/eu-west-1/ec2/terraform.tfstate"
    region       = "eu-west-1" 
    encrypt      = true
    use_lockfile = true
  }
}
