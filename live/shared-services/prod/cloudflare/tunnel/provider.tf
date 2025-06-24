terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  profile = "ss"
}

provider "cloudflare" {
  api_token = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.cloudflare_api_token.secret_string))["api-token"]
}


data "aws_secretsmanager_secret" "cloudflare_api_token" {
  name = "shared-services/application-static-secrets/cloudflare"
}

data "aws_secretsmanager_secret_version" "cloudflare_api_token" {
  secret_id = data.aws_secretsmanager_secret.cloudflare_api_token.id
}
