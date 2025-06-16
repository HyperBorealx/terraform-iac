provider "aws" {
  profile = "dev-mec"
}
provider "aws" {
  region  = "us-east-1"
  profile = "dev-mec"
  alias   = "acm"
}
provider "aws" {
  region  = "eu-west-1"
  profile = "ss"
  alias   = "ss"
}
