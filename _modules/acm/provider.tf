terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
      configuration_aliases = [aws, aws.acm, aws.ss]
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
data "aws_ssm_parameter" "cf-api-token" {
  provider = aws.ss
  name     = "/CodeBuild/terraform/cloudflare/api-key"
}

provider "cloudflare" {
  api_token = data.aws_ssm_parameter.cf-api-token.value
}
