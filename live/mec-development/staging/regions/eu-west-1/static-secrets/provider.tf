provider "aws" {
  region = "eu-west-1"
  profile = "dev-mec"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    sops = {
      source = "carlpett/sops"
      version = "~> 1.2.0"
    }
  }
}
