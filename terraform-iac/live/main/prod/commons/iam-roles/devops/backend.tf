terraform {
  backend "s3" {
    bucket         = "psl-group-central-terraform-state"
    key            = "main/prod/commons/iam-roles/devops/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = true
  }
}
