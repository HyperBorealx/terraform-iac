data "sops_file" "this" {
  source_file = "./values/argocd-secrets.yaml"
}
data "terraform_remote_state" "eks" {
  backend = "s3" # Adjust as needed based on your backend configuration

  config = {
    bucket  = "psl-group-central-terraform-state"
    key     = "shared-services/prod/eu-west-1/eks/devops/terraform.tfstate"
    region  = "eu-west-1"
  }
}

# Get EKS auth token
data "aws_eks_cluster_auth" "cluster" {
  name = "shared-services-prod"
}


# First create the namespace so we can create secrets in it
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_secret" "argocd_repo_shared_services" {
  metadata {
    name      = "repo-shared-services-gitops"
    namespace = kubernetes_namespace.argocd.metadata[0].name
    labels = {
      "app.kubernetes.io/part-of"      = "argocd"
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    type                    = "git"
    url                     = "https://github.com/PSL-Group-Services-Sarl/shared-services-gitops.git"
    githubAppID             = "1235129"
    githubAppInstallationID = "65885338"
    githubAppPrivateKey = data.sops_file.this.data["argocd.githubAppPrivateKey"]
  }
}

# Deploy ArgoCD
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.9.0"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  values = [
    file("${path.module}/values/argocd.yaml")
  ]

  # Set admin password
  set_sensitive {
    name  = "configs.secret.argocdServerAdminPassword"
    value = data.sops_file.this.data["argocd.admin.password"]
  }

  # Wait for resources to be ready
  wait    = true
  timeout = 600 # 10 minutes
}

resource "helm_release" "argocd_apps" {
  name       = "argocd-apps"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = "2.0.2"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  values = [
    file("${path.module}/values/argocd-apps.yaml")
  ]

  depends_on = [helm_release.argocd]
}
