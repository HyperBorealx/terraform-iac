output "cluster_arns" {
  description = "Map of elasticache names to their ARNs"
  value = {
    for k, elasticache in module.elasticache : k => elasticache.cluster_arn
  }
}
