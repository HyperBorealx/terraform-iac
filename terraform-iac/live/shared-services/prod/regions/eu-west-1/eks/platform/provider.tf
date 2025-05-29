terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "sops" {}

# Configure Kubernetes provider using remote state data
provider "kubernetes" {
  host                   = data.terraform_remote_state.eks.outputs.cluster_endpoints["shared-services-prod"]
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data["shared-services-prod"])
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoints["shared-services-prod"]
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data["shared-services-prod"])
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
