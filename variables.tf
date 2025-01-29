# Required

variable "tfe_license" {
  type        = string
  description = "The license for Terraform Enterprise."
}

variable "route53_zone_name" {
  type        = string
  description = "The name of the Route53 zone used to host Terraform Enterprise."
}

variable "ec2_bastion_ssh_public_key" {
  type        = string
  description = "The SSH public key used to authenticate to the Bastion EC2 instance."
}

# Optional

# Terraform Enterprise

variable "tfe_version" {
  type        = string
  description = "The version of Terraform Enterprise to deploy."
  default     = "v202501-1"
}

# VPC

variable "vpc_name" {
  type        = string
  description = "The name of the VPC used to host Terraform Enterprise."
  default     = "tfe-vpc"
}

variable "vpc_azs" {
  type        = list(string)
  description = "A list of availability zone names to deploy to in the region."
  default     = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}

variable "s3_vpc_endpoint_name" {
  type        = string
  description = "The name of the S3 VPC endpoint."
  default     = "tfe-vpce-s3"
}

variable "ec2_bastion_security_group_name" {
  type        = string
  description = "The name of the EC2 Bastion Host security group."
  default     = "ec2-bastion-sg"
}

variable "tfe_security_group_name" {
  type        = string
  description = "The name of the Terraform Enterprise EC2 hosts security group."
  default     = "tfe-sg"
}

variable "alb_security_group_name" {
  type        = string
  description = "The name of the Application Load Balancer security group."
  default     = "alb-sg"
}

variable "rds_security_group_name" {
  type        = string
  description = "The name of the RDS security group."
  default     = "rds-sg"
}

variable "elasticache_security_group_name" {
  type        = string
  description = "The name of the ElastiCache security group."
  default     = "elasticache-sg"
}

# EC2

variable "ec2_bastion_instance_name" {
  type        = string
  description = "The name of the Bastion EC2 instance."
  default     = "Bastion Host"
}

variable "ec2_bastion_instance_type" {
  type        = string
  description = "The type (size) of the Bastion EC2 instance."
  default     = "t3.nano"
}

variable "ec2_tfe_instance_name" {
  type        = string
  description = "The name of the TFE EC2 instance."
  default     = "TFE Host"
}

variable "ec2_tfe_instance_type" {
  type        = string
  description = "The type (size) of the TFE EC2 instance."
  default     = "t3.medium"
}

variable "asg_name" {
  type        = string
  description = "The name of the ASG for the TFE hosts."
  default     = "tfe-asg"
}

variable "asg_min_size" {
  type        = number
  description = "The minimum number of hosts allowed in the TFE auto scaling group."
  default     = 0
}

variable "asg_max_size" {
  type        = number
  description = "The maximum number of hosts allowed in the TFE auto scaling group."
  default     = 2
}

variable "asg_desired_capacity" {
  type        = number
  description = "The desired number of hosts active in the TFE auto scaling group."
  default     = 2
}

variable "lb_name" {
  type        = string
  description = "The name of the application load balancer used to distribute HTTPS traffic across TFE hosts."
  default     = "tfe-web-alb"
}

variable "lb_target_group_name" {
  type        = string
  description = "The name of the target group used to direct HTTPS traffic to TFE hosts."
  default     = "tfe-web-alb-tg"
}

# RDS

variable "postgresql_version" {
  type        = string
  description = "The version of the PostgreSQL engine to deploy."
  default     = "17.2"
}

variable "tfe_database_name" {
  type        = string
  description = "The name of the database used to store Terraform Enterprise data in."
  default     = "tfe"
}

variable "tfe_database_user" {
  type        = string
  description = "The user with access the Terraform Enterprise database."
  default     = "tfe"
}

variable "rds_instance_name" {
  type        = string
  description = "The name of the RDS instance used to store Terraform Enterprise data in."
  default     = "tfe-postgres-db"
}

variable "rds_instance_class" {
  type        = string
  description = "The instance type (size) of the RDS instance."
  default     = "db.t3.medium"
}

variable "rds_instance_master_user" {
  type        = string
  description = "The RDS master user."
  default     = "tfeadmin"
}

variable "rds_subnet_group_name" {
  type        = string
  description = "The name of the RDS subnet group."
  default     = "rds-sg"
}

variable "rds_parameter_group_name" {
  type        = string
  description = "The name of the RDS parameter group."
  default     = "rds-pg"
}

# ElastiCache

variable "redis_version" {
  type        = string
  description = "The version of the Redis engine to deploy."
  default     = "7.1"
}

variable "elasticache_replication_group_name" {
  type        = string
  description = "The name of the ElastiCache replication group used as the Terraform Enterprise Redis cache."
  default     = "tfe-redis-cache"
}

variable "elasticache_node_type" {
  type        = string
  description = "The node type (size) of the ElastiCache nodes."
  default     = "cache.t3.medium"
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "The name of the ElastiCache subnet group."
  default     = "elasticache-sg"
}

# Route53

variable "tfe_subdomain" {
  type        = string
  description = "The subdomain used for Terraform Enterprise."
  default     = "tfe"
}

# IAM

variable "ec2_iam_role_name" {
  type        = string
  description = "The name of the IAM role assigned to the EC2 instance profile assigned to the Terraform Enterprise hosts."
  default     = "tfe-iam-role"
}

variable "ec2_instance_profile_name" {
  type        = string
  description = "The name of the EC2 instance profile assigned to the Terraform Enterprise hosts."
  default     = "tfe-instance-profile"
}
