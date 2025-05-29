provider "aws" {
  region = "eu-west-1"
  profile = "svc-admin"
}

# Additional provider for assume role operations (enables both local and CI operations)
provider "aws" {
  alias  = "assume_role"
  region = "eu-west-1"
  
  assume_role {
    role_arn     = "arn:aws:iam::451063263679:role/atlantis-deployment-role"
    external_id  = "8a7b6c5d4e3f2g1h0i9j8k7l6m5n4o3p"
    session_name = "terraform-eks-devops"
  }
}

# Backend provider if different from deployment account
provider "aws" {
  alias  = "backend"
  region = "eu-west-1"
  profile = "svc-admin"
}
