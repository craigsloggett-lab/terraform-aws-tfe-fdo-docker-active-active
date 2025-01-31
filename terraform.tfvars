# Required

# Note: Sensitive variables are not included here

route53_zone_name          = "craig-sloggett.sbx.hashidemos.io"
ec2_bastion_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDEYtDnLmY9nus0dhQm1GlIVSQB7BswxGYnugA8Ag9JA"

# Optional

# Terraform Enterprise
tfe_version = "v202501-1"

# VPC
vpc_name                        = "tfe-vpc"
vpc_azs                         = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
s3_vpc_endpoint_name            = "tfe-vpce-s3"
ec2_bastion_security_group_name = "ec2-bastion-sg"
tfe_security_group_name         = "tfe-sg"
alb_security_group_name         = "alb-sg"
rds_security_group_name         = "rds-sg"
elasticache_security_group_name = "elasticache-sg"

# EC2
ec2_bastion_instance_name = "Bastion Host"
ec2_bastion_instance_type = "t3.nano"
ec2_tfe_instance_name     = "TFE Host"
ec2_tfe_instance_type     = "t3.medium"
asg_name                  = "tfe-asg"
asg_min_size              = 0
asg_max_size              = 2
asg_desired_capacity      = 2
lb_name                   = "tfe-web-alb"
lb_target_group_name      = "tfe-web-alb-tg"

# RDS
postgresql_version       = "16.6"
tfe_database_name        = "tfe"
tfe_database_user        = "tfe"
rds_instance_name        = "tfe-postgres-db"
rds_instance_class       = "db.t3.medium"
rds_instance_master_user = "tfeadmin"
rds_subnet_group_name    = "rds-sg"
rds_parameter_group_name = "rds-pg"

# ElastiCache
redis_version                      = "7.1"
elasticache_replication_group_name = "tfe-redis-cache"
elasticache_node_type              = "cache.t3.medium"
elasticache_subnet_group_name      = "elasticache-sg"

# Route53
tfe_subdomain = "tfe"

# IAM
ec2_iam_role_name         = "tfe-iam-role"
ec2_instance_profile_name = "tfe-instance-profile"
