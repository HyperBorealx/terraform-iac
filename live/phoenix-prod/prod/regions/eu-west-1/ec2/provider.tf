provider "aws" {
  region  = "eu-west-1"
  profile = "phoenix-prod"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
