provider "aws" {
  profile = "noc-1"
}

provider "aws" {
  alias = "tgw"
  profile = "noc-1"
}
