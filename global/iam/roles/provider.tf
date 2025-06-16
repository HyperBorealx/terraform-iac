provider "aws" {
  region  = "eu-west-1"
  profile = "ss"
  alias   = "ss"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "ss-testing"
  alias   = "ss-testing"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "noc-1"
  alias   = "noc-1"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "noc-2"
  alias   = "noc-2"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "prod-cdn-mec"
  alias   = "prod-cdn-mec"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "dev-mec"
  alias   = "dev-mec"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "main"
  alias   = "main"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "phoenix-prod"
  alias   = "phoenix-prod"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "prod-data-mgmt"
  alias   = "prod-data-mgmt"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "leg-mec-sandbox"
  alias   = "leg-mec-sandbox"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "dev-app"
  alias   = "dev-app"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "dev-data"
  alias   = "dev-data"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "dev-data-mgmt"
  alias   = "dev-data-mgmt"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "leg-prod-data"
  alias   = "leg-prod-data"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "prod-amplify-mec"
  alias   = "prod-amplify-mec"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "appdev-sandbox"
  alias   = "appdev-sandbox"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "soundboard-sandbox"
  alias   = "soundboard-sandbox"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "soundboard-prod"
  alias   = "soundboard-prod"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "sandbox-data-mgmt"
  alias   = "sandbox-data-mgmt"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
