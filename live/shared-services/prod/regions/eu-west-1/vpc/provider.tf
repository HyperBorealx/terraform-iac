provider "aws" {
  profile = "ss"
}

provider "aws" {
  alias   = "tgw"
  profile = "main"
}