iam_roles = {
  "atlantisbase" = {
    iam_role_description   = "base role for atlantis"
    iam_policy_description = "base permissions for atlantis"
  }
  "atlantisexecution" = {
    iam_role_description   = "atlantis provisioner"
    iam_policy_description = "permissions for provisioning resources"
  }
}
