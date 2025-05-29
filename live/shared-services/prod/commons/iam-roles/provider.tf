# provider "aws" {
#   region = "eu-west-1"

#   assume_role {
#     role_arn = "arn:aws:iam::300476207176:role/atlantisexecution"
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
