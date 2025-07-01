provider "aws" {
  region  = "ap-southeast-1"
  profile = "main"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
