variable "clusters" {
  description = "Map of EKS clusters to create"
  type = map(object({
    cluster_name                             = string
    cluster_version                          = optional(string, "1.33")
    vpc_id                                   = string
    subnet_ids                               = list(string)
    cluster_endpoint_public_access           = optional(bool, false)
    cluster_endpoint_private_access          = optional(bool, true)
    enable_cluster_creator_admin_permissions = optional(bool, true)
    node_groups                              = optional(map(any), {})
    tags                                     = optional(map(string), {})
    eks_managed_node_groups                  = optional(map(any), {})
    cluster_addons                           = optional(map(any), {})
    cluster_compute_config = optional(object({
      enabled    = bool
      node_pools = list(string)
      }), {
      enabled    = true
      node_pools = []
    })

    # New authentication parameters
    authentication_mode = optional(string, "API_AND_CONFIG_MAP")

    # EKS Access Entries for IAM principals
    access_entries = optional(map(object({
      principal_arn     = string
      kubernetes_groups = optional(list(string), [])
      type              = optional(string, "STANDARD")

      # Access policies
      policy_associations = optional(map(object({
        policy_arn = string
        access_scope = optional(object({
          type       = string
          namespaces = optional(list(string), [])
        }), null)
      })), {})
    })), {})
  }))
}
