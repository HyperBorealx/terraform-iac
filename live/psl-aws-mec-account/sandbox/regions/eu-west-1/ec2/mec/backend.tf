terraform {
  backend "s3" {
    bucket         = "psl-group-central-terraform-state"
    key            = "psl-aws-mec-account/sandbox/regions/eu-west-1/ec2/mec/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = true
  }
}
