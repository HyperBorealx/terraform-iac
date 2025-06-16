module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"

  for_each = var.clusters

  cluster_name                             = each.value.cluster_name
  cluster_version                          = each.value.cluster_version
  vpc_id                                   = each.value.vpc_id
  subnet_ids                               = each.value.subnet_ids
  cluster_endpoint_public_access           = each.value.cluster_endpoint_public_access
  cluster_endpoint_private_access          = each.value.cluster_endpoint_private_access
  enable_cluster_creator_admin_permissions = each.value.enable_cluster_creator_admin_permissions
  cluster_addons                           = each.value.cluster_addons
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }
  cluster_security_group_additional_rules = {
    ingress_vpc_cidr = {
      description = "Allow ingress from 10.0.0.0/8"
      protocol    = "-1" # All protocols
      from_port   = 0    # All ports
      to_port     = 0    # All ports
      cidr_blocks = ["10.0.0.0/8"]
      type        = "ingress"
    }
  }
  cluster_compute_config = each.value.cluster_compute_config
  # Enable API authentication mode for EKS Access Entries
  authentication_mode = each.value.authentication_mode

  # Configure access entries for IAM roles/users
  access_entries = each.value.access_entries

  # Configure EKS managed node groups
  eks_managed_node_groups = each.value.eks_managed_node_groups

  tags = merge(each.value.tags, { TerraformTrack = trim(
    replace(
      path.cwd,
      regexall("^.*/live/", path.cwd)[0],
      ""
    ),
    "/"
  ) })
}
