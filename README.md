# Terraform Enterprise on Docker in Active-Active Mode to AWS Terraform Module

Deploy Terraform Enterprise on Docker in active-active mode to AWS.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.84.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.5 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.18.1 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_autoscaling_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_db_instance.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_elasticache_replication_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_iam_instance_profile.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.ec2_modify_metadata](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tfe_get_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tfe_put_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tfe_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tfe_secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ec2_modify_metadata](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.tfe_get_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.tfe_put_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.tfe_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.tfe_secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_template.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.alias_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cert_validation_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.tfe_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.tfe_sse](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.tfe_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.elasticache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.postgresql_major_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_admin_token_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_database_host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_database_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_database_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_database_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_encryption_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_hostname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_license](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_object_storage_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_object_storage_s3_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_redis_host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_redis_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.tfe_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_security_group_egress_rule.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.elasticache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.bastion_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.elasticache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.tfe_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.tfe_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.tfe_vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [random_string.tfe_database_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.tfe_encryption_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.tfe_redis_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_ami.debian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ec2_modify_metadata](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tfe_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tfe_get_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tfe_put_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tfe_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tfe_secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_kms_key.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_kms_key.secretsmanager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_kms_key.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_security_group_name"></a> [alb\_security\_group\_name](#input\_alb\_security\_group\_name) | The name of the Application Load Balancer security group. | `string` | `"alb-sg"` | no |
| <a name="input_asg_desired_capacity"></a> [asg\_desired\_capacity](#input\_asg\_desired\_capacity) | The desired number of hosts active in the TFE auto scaling group. | `number` | `2` | no |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | The maximum number of hosts allowed in the TFE auto scaling group. | `number` | `2` | no |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | The minimum number of hosts allowed in the TFE auto scaling group. | `number` | `0` | no |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | The name of the ASG for the TFE hosts. | `string` | `"tfe-asg"` | no |
| <a name="input_ec2_bastion_instance_name"></a> [ec2\_bastion\_instance\_name](#input\_ec2\_bastion\_instance\_name) | The name of the Bastion EC2 instance. | `string` | `"Bastion Host"` | no |
| <a name="input_ec2_bastion_instance_type"></a> [ec2\_bastion\_instance\_type](#input\_ec2\_bastion\_instance\_type) | The type (size) of the Bastion EC2 instance. | `string` | `"t3.nano"` | no |
| <a name="input_ec2_bastion_security_group_name"></a> [ec2\_bastion\_security\_group\_name](#input\_ec2\_bastion\_security\_group\_name) | The name of the EC2 Bastion Host security group. | `string` | `"ec2-bastion-sg"` | no |
| <a name="input_ec2_bastion_ssh_public_key"></a> [ec2\_bastion\_ssh\_public\_key](#input\_ec2\_bastion\_ssh\_public\_key) | The SSH public key used to authenticate to the Bastion EC2 instance. | `string` | n/a | yes |
| <a name="input_ec2_iam_role_name"></a> [ec2\_iam\_role\_name](#input\_ec2\_iam\_role\_name) | The name of the IAM role assigned to the EC2 instance profile assigned to the Terraform Enterprise hosts. | `string` | `"tfe-iam-role"` | no |
| <a name="input_ec2_instance_profile_name"></a> [ec2\_instance\_profile\_name](#input\_ec2\_instance\_profile\_name) | The name of the EC2 instance profile assigned to the Terraform Enterprise hosts. | `string` | `"tfe-instance-profile"` | no |
| <a name="input_ec2_tfe_instance_name"></a> [ec2\_tfe\_instance\_name](#input\_ec2\_tfe\_instance\_name) | The name of the TFE EC2 instance. | `string` | `"TFE Host"` | no |
| <a name="input_ec2_tfe_instance_type"></a> [ec2\_tfe\_instance\_type](#input\_ec2\_tfe\_instance\_type) | The type (size) of the TFE EC2 instance. | `string` | `"t3.medium"` | no |
| <a name="input_elasticache_node_type"></a> [elasticache\_node\_type](#input\_elasticache\_node\_type) | The node type (size) of the ElastiCache nodes. | `string` | `"cache.t3.medium"` | no |
| <a name="input_elasticache_replication_group_name"></a> [elasticache\_replication\_group\_name](#input\_elasticache\_replication\_group\_name) | The name of the ElastiCache replication group used as the Terraform Enterprise Redis cache. | `string` | `"tfe-redis-cache"` | no |
| <a name="input_elasticache_security_group_name"></a> [elasticache\_security\_group\_name](#input\_elasticache\_security\_group\_name) | The name of the ElastiCache security group. | `string` | `"elasticache-sg"` | no |
| <a name="input_elasticache_subnet_group_name"></a> [elasticache\_subnet\_group\_name](#input\_elasticache\_subnet\_group\_name) | The name of the ElastiCache subnet group. | `string` | `"elasticache-sg"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | The name of the application load balancer used to distribute HTTPS traffic across TFE hosts. | `string` | `"tfe-web-alb"` | no |
| <a name="input_lb_target_group_name"></a> [lb\_target\_group\_name](#input\_lb\_target\_group\_name) | The name of the target group used to direct HTTPS traffic to TFE hosts. | `string` | `"tfe-web-alb-tg"` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | The version of the PostgreSQL engine to deploy. | `string` | `"17.2"` | no |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | The instance type (size) of the RDS instance. | `string` | `"db.t3.medium"` | no |
| <a name="input_rds_instance_master_user"></a> [rds\_instance\_master\_user](#input\_rds\_instance\_master\_user) | The RDS master user. | `string` | `"tfeadmin"` | no |
| <a name="input_rds_instance_name"></a> [rds\_instance\_name](#input\_rds\_instance\_name) | The name of the RDS instance used to store Terraform Enterprise data in. | `string` | `"tfe-postgres-db"` | no |
| <a name="input_rds_parameter_group_name"></a> [rds\_parameter\_group\_name](#input\_rds\_parameter\_group\_name) | The name of the RDS parameter group. | `string` | `"rds-pg"` | no |
| <a name="input_rds_security_group_name"></a> [rds\_security\_group\_name](#input\_rds\_security\_group\_name) | The name of the RDS security group. | `string` | `"rds-sg"` | no |
| <a name="input_rds_subnet_group_name"></a> [rds\_subnet\_group\_name](#input\_rds\_subnet\_group\_name) | The name of the RDS subnet group. | `string` | `"rds-sg"` | no |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | The version of the Redis engine to deploy. | `string` | `"7.1"` | no |
| <a name="input_route53_zone_name"></a> [route53\_zone\_name](#input\_route53\_zone\_name) | The name of the Route53 zone used to host Terraform Enterprise. | `string` | n/a | yes |
| <a name="input_s3_vpc_endpoint_name"></a> [s3\_vpc\_endpoint\_name](#input\_s3\_vpc\_endpoint\_name) | The name of the S3 VPC endpoint. | `string` | `"tfe-vpce-s3"` | no |
| <a name="input_tfe_database_name"></a> [tfe\_database\_name](#input\_tfe\_database\_name) | The name of the database used to store Terraform Enterprise data in. | `string` | `"tfe"` | no |
| <a name="input_tfe_database_user"></a> [tfe\_database\_user](#input\_tfe\_database\_user) | The user with access the Terraform Enterprise database. | `string` | `"tfe"` | no |
| <a name="input_tfe_license"></a> [tfe\_license](#input\_tfe\_license) | The license for Terraform Enterprise. | `string` | n/a | yes |
| <a name="input_tfe_security_group_name"></a> [tfe\_security\_group\_name](#input\_tfe\_security\_group\_name) | The name of the Terraform Enterprise EC2 hosts security group. | `string` | `"tfe-sg"` | no |
| <a name="input_tfe_subdomain"></a> [tfe\_subdomain](#input\_tfe\_subdomain) | The subdomain used for Terraform Enterprise. | `string` | `"tfe"` | no |
| <a name="input_tfe_version"></a> [tfe\_version](#input\_tfe\_version) | The version of Terraform Enterprise to deploy. | `string` | n/a | yes |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | A list of availability zone names to deploy to in the region. | `list(string)` | <pre>[<br/>  "ca-central-1a",<br/>  "ca-central-1b",<br/>  "ca-central-1d"<br/>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC used to host Terraform Enterprise. | `string` | `"tfe-vpc"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
