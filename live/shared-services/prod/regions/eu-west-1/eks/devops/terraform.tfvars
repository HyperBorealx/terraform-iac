clusters = {
  shared-services-prod = {
    cluster_name = "shared-services-prod"
    vpc_id       = "vpc-0a29462de21f69a10"
    subnet_ids   = ["subnet-012dfd10592800c0b", "subnet-071436070936b8e6e"]
    cluster_compute_config = {
      enabled    = true
      node_pools = ["general-purpose", "system"]
    }

    authentication_mode = "API"
    access_entries = {
      "admin-role" = {
        principal_arn = "arn:aws:iam::300476207176:role/aws-reserved/sso.amazonaws.com/eu-west-1/AWSReservedSSO_psl-devops-admin_dd6706127c8fe275"
        policy_associations = {
          admin_policy = {
            policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
            access_scope = {
              type = "cluster"
            }
          }
        }
      },
      "admin-noc" = {
        principal_arn = "arn:aws:iam::300476207176:role/aws-reserved/sso.amazonaws.com/eu-west-1/AWSReservedSSO_psl-noc-admin_09637f053e9804e4"
        policy_associations = {
          admin_policy = {
            policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
            access_scope = {
              type = "cluster"
            }
          }
        }
      },
    }

    tags = {
      Owner       = "DevOps"
      DRI         = "DevOps"
      Environment = "Production"
      ComputeType = "EKS"
      SLALevel    = "Tier1"
    }
  }
}
