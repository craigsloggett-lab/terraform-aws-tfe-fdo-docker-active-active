#!/bin/sh

# Globally disable globbing and enable exit-on-error.
set -ef

# Required environment variables.
commit_sha="${COMMIT_SHA:?Please set the COMMIT_SHA environment variable and run the script again.}"
route53_zone_name="${ROUTE53_ZONE_NAME:?Please set the ROUTE53_ZONE_NAME environment variable and run the script again.}"
tfe_version="${TFE_VERSION:?Please set the TFE_VERSION environment variable and run the script again.}"
ec2_bastion_ssh_public_key="${EC2_BASTION_SSH_PUBLIC_KEY:?Please set the EC2_BASTION_SSH_PUBLIC_KEY environment variable and run the script again.}"

# Trim the commit SHA to look like the commits shown in a PR conversation.
short_commit_sha=$(printf '%s\n' "${commit_sha}" | cut -c1-7)

cat <<EOF >terraform.tfvars
tfe_version                = "${tfe_version}"
ec2_bastion_ssh_public_key = "${ec2_bastion_ssh_public_key}"

route53_zone_name                  = "${route53_zone_name}-${short_commit_sha}"
vpc_name                           = "tfe-vpc-${short_commit_sha}"
s3_vpc_endpoint_name               = "tfe-vpce-s3-${short_commit_sha}"
ec2_bastion_security_group_name    = "ec2-bastion-sg-${short_commit_sha}"
tfe_security_group_name            = "tfe-sg-${short_commit_sha}"
alb_security_group_name            = "alb-sg-${short_commit_sha}"
rds_security_group_name            = "rds-sg-${short_commit_sha}"
elasticache_security_group_name    = "elasticache-sg-${short_commit_sha}"
ec2_bastion_instance_name          = "Bastion Host ${short_commit_sha}"
ec2_tfe_instance_name              = "TFE Host ${short_commit_sha}"
asg_name                           = "tfe-asg-${short_commit_sha}"
lb_name                            = "tfe-web-alb-${short_commit_sha}"
lb_target_group_name               = "tfe-web-alb-tg-${short_commit_sha}"
tfe_database_name                  = "tfe-${short_commit_sha}"
rds_instance_name                  = "tfe-postgres-db-${short_commit_sha}"
rds_subnet_group_name              = "rds-sg-${short_commit_sha}"
rds_parameter_group_name           = "rds-pg-${short_commit_sha}"
elasticache_replication_group_name = "tfe-redis-cache-${short_commit_sha}"
elasticache_subnet_group_name      = "elasticache-sg-${short_commit_sha}"
ec2_iam_role_name                  = "tfe-iam-role-${short_commit_sha}"
ec2_instance_profile_name          = "tfe-instance-profile-${short_commit_sha}"
EOF
