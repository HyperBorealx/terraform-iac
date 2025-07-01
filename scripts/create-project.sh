#!/bin/bash
set -e

# Usage function
usage() {
  echo "Usage: $0 <account> <environment> <region> <resource-type> <resource-name>"
  echo "Example: $0 shared-services prod eu-west-1 eks cluster1"
  exit 1
}

# Check arguments
if [ $# -ne 5 ]; then
  usage
fi

ACCOUNT=$1
ENV=$2
REGION=$3
RESOURCE_TYPE=$4
RESOURCE_NAME=$5

# Create directory structure
PROJECT_DIR="${PWD}/live/${ACCOUNT}/${ENV}/regions/${REGION}/${RESOURCE_TYPE}/${RESOURCE_NAME}"
mkdir -p "$PROJECT_DIR"

# Create main.tf with module reference
cat > "${PROJECT_DIR}/main.tf" << EOL
variable "clusters" {
  description = "Map of EKS clusters to create"
  type = map(object({
    cluster_name                    = string
    cluster_version                 = string
    vpc_id                          = string
    subnet_ids                      = list(string)
    cluster_endpoint_public_access  = optional(bool, true)
    cluster_endpoint_private_access = optional(bool, false)
    node_groups                     = map(any)
    tags                            = optional(map(string), {})
  }))
}

module "eks_clusters" {
  source = "../../../../../../_modules/eks"
  
  clusters = var.clusters
}

output "cluster_endpoints" {
  value = module.eks_clusters.cluster_endpoints
}
EOL

# Create terraform.tfvars template
cat > "${PROJECT_DIR}/terraform.tfvars" << EOL
clusters = {
  "${RESOURCE_NAME}" = {
    cluster_name    = "${RESOURCE_NAME}-eks"
    cluster_version = "1.27"
    vpc_id          = "vpc-12345678"  # REPLACE WITH ACTUAL VPC ID
    subnet_ids      = ["subnet-12345678", "subnet-87654321"]  # REPLACE WITH ACTUAL SUBNET IDS
    
    node_groups = {
      default = {
        name = "default-node-group"
        
        min_size     = 1
        max_size     = 3
        desired_size = 2
        
        instance_types = ["t3.medium"]
        capacity_type  = "ON_DEMAND"
      }
    }
    
    tags = {
      Project     = "${RESOURCE_NAME}"
      Environment = "${ENV}"
    }
  }
}
EOL

# Create provider.tf
cat > "${PROJECT_DIR}/provider.tf" << EOL
provider "aws" {
  region = "${REGION}"
  
  # For local development with profile
  profile = "${ACCOUNT}"
  
  # For Atlantis with assume role
  # assume_role {
  #   role_arn     = "arn:aws:iam::ACCOUNT_ID:role/atlantis-deployment-role"
  #   external_id  = "EXTERNAL_ID"
  #   session_name = "terraform-${RESOURCE_TYPE}-${RESOURCE_NAME}"
  # }
}
EOL

# Generate backend config
"$(dirname "$0")/tf-backend-init.sh" "$PROJECT_DIR"

echo "Project created at ${PROJECT_DIR}"
echo "Next steps:"
echo "1. Edit terraform.tfvars to set actual VPC ID and subnet IDs"
echo "2. Run: cd ${PROJECT_DIR} && terraform init"
