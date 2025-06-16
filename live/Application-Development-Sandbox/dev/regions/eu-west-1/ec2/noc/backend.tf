terraform {
  backend "s3" {
    bucket         = "psl-group-central-terraform-state"
    key            = "Application-Development-Sandbox/dev/regions/eu-west-1/ec2/noc/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = true
  }
}
