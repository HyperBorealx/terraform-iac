provider "aws" {
  region  = "us-east-1"  # Lambda@Edge requirement
  profile = "dev-mec"
}

terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.83"
    }
  }
}