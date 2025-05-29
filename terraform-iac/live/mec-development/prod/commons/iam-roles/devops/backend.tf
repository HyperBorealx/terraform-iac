terraform {
  backend "s3" {
    bucket         = "psl-group-central-terraform-state"
    key            = "mec-development/prod/commons/iam-roles/devops/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
