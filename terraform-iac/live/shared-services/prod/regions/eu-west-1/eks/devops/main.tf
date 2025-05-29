variable "clusters" {
  description = "Map of EKS clusters to create"
  type        = any
}
module "eks_clusters" {
  source = "../../../../../../../_modules/eks-cluster"

  clusters = var.clusters
}

output "cluster_id" {
  description = "The name/id of the EKS cluster"
  value       = module.eks_clusters.cluster_id
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required for communication with the cluster"
  value       = module.eks_clusters.cluster_certificate_authority_data
}

# Add additional pass-through outputs
output "cluster_endpoints" {
  description = "Endpoints of the EKS clusters"
  value       = module.eks_clusters.cluster_endpoints
}

output "cluster_arns" {
  description = "ARNs of the EKS clusters"
  value       = module.eks_clusters.cluster_arns
}
