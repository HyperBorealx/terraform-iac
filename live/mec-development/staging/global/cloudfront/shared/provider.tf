provider "aws" {
  region  = "eu-west-1"
  profile = "dev-mec"
  }


#provider if needed for ACM certificates.
provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"
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