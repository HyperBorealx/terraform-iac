elasticaches = {
  sc-parser-develop-redis-01 = {
    apply_immediately        = false
    node_type                = "cache.t4g.medium"
    port                     = 6379
    parameter_group_name     = "default.redis7" 
    num_cache_clusters       = 2
    num_node_groups          = 1
    engine_version           = "7.1"
    subnet_group_name        = "sc-205551755912-pp-syjoaada5b2gw-cachesubnetgroup-q8c83q6yrjvy"
    security_group_ids       = ["sg-0fc44d069972414a2"]
    snapshot_window          = "05:00-09:00"
    snapshot_retention_limit = 7
    replicas_per_node_group  = 3
    kms_key_arn              = "arn:aws:kms:eu-west-1:205551755912:key/67cf3368-9989-4043-ba55-e0d4508ec22e"
    tags = {
      ApplicationName = "parser"
      BusinessGroup   = "SharedComponents"
      Environment     = "develop"
      User            = "PSL GROUP Team"
    }
    description = "ElastiCache Redis Replication Group with optional cluster mode, encryption, authentication, automatic failover, KMS encryption, logging, multi-AZ, and node groups configuration"
  }
}

