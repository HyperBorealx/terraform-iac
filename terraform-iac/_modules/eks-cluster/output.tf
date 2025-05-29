output "cluster_arns" {
  description = "ARNs of created clusters"
  value = {
    for k, v in module.eks : k => v.cluster_arn
  }
}

output "cluster_endpoints" {
  description = "Endpoints of created clusters"
  value = {
    for k, v in module.eks : k => v.cluster_endpoint
  }
}

# New outputs needed for Kubernetes/Helm providers

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required by clients to communicate with the cluster"
  value = {
    for k, v in module.eks : k => v.cluster_certificate_authority_data
  }
}

output "cluster_id" {
  description = "The name/id of the EKS cluster"
  value = {
    for k, v in module.eks : k => v.cluster_id
  }
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value = {
    for k, v in module.eks : k => v.cluster_name
  }
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
  value = {
    for k, v in module.eks : k => v.cluster_oidc_issuer_url
  }
}

output "oidc_provider" {
  description = "The OpenID Connect identity provider (without protocol and path)"
  value = {
    for k, v in module.eks : k => v.oidc_provider
  }
}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC Provider"
  value = {
    for k, v in module.eks : k => v.oidc_provider_arn
  }
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value = {
    for k, v in module.eks : k => v.cluster_security_group_id
  }
}

output "cluster_status" {
  description = "Status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED"
  value = {
    for k, v in module.eks : k => v.cluster_status
  }
}
