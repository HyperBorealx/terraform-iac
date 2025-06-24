clusters = {
  psl-3rd-party-apps-staging = {
    vpc_id       = "vpc-0c8cd4148085a3979"
    subnet_ids   = ["subnet-05b874057314075c3", "subnet-0050614a34c1ff7bc"]
    cluster_compute_config = {
      enabled    = true
      node_pools = ["general-purpose", "system"]
    }

    authentication_mode = "API"
    access_entries = {
      "admin-role" = {
        principal_arn = "arn:aws:iam::611787202005:role/aws-reserved/sso.amazonaws.com/eu-west-1/AWSReservedSSO_psl-devops-admin_f22f2f979eb68b42"
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
        principal_arn = "arn:aws:iam::611787202005:role/aws-reserved/sso.amazonaws.com/eu-west-1/AWSReservedSSO_psl-noc-admin_685197ff9c138b73"
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
      Owner       = "NOC"
      DRI         = "NOC"
      Environment = "Staging"
      ComputeType = "EKS"
      SLALevel    = "Tier1"
    }
  }
}
