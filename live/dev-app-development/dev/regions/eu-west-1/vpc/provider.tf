provider "aws" {
  region = "eu-west-1"
  profile = "dev-app"
}

provider "aws" {
  alias = "tgw"
  profile = "main"
}
