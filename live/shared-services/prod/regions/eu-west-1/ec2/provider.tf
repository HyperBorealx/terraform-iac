provider "aws" {
  region  = "eu-west-1"
  profile = "ss"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
