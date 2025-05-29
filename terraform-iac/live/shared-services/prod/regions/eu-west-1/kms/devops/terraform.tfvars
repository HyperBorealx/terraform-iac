keys = {
  shared-services-sops = {
    description             = "CMK for shared-services/prod"
    enable_key_rotation     = true
    deletion_window_in_days = 7

    tags = {
      Environment = "prod"
      Team        = "DevOps"
    }

    aliases = [
      "alias/prod-shared-services"
    ]

    allowed_iam_roles = [
      "arn:aws:iam::300476207176:role/atlantisbase",
      "arn:aws:iam::300476207176:role/atlantisexecution",
    ]

    allowed_iam_role_patterns = [
      "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_psl-devops-admin_*",
      "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/*/AWSReservedSSO_psl-devops-admin_*",
    ]
  }
}
