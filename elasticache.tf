resource "aws_elasticache_subnet_group" "tfe" {
  name       = var.elasticache_subnet_group_name
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = var.elasticache_subnet_group_name
  }
}

resource "aws_elasticache_replication_group" "tfe" {
  replication_group_id       = var.elasticache_replication_group_name
  description                = "Terraform Enterprise Redis Cache"
  automatic_failover_enabled = true
  node_type                  = var.elasticache_node_type
  port                       = 6379
  engine                     = "redis"
  engine_version             = var.redis_version
  multi_az_enabled           = true
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = random_string.tfe_redis_password.result
  num_cache_clusters         = 2
  snapshot_retention_limit   = 0
  security_group_ids         = [aws_security_group.elasticache.id]
  subnet_group_name          = aws_elasticache_subnet_group.tfe.name
  parameter_group_name       = "default.redis7"
}
