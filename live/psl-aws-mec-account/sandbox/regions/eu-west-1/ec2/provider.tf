provider "aws" {
  region = "eu-west-1"
  profile = "leg-mec-sandbox"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
