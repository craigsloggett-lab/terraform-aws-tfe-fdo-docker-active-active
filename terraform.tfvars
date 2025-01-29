# Required

# Note: Sensitive variables are not included here

tfe_license                         = "02MV4UU43BK5HGYYTOJZWFQMTMNNEWU33JJZ5GQ2KNK5GXSWLNKF2FUR2JO5MVGMLKLJKE26SMKRSGSTTNKV2E46THGVHEIRTMJ5CFE22NGJETISLJO5UVSM2WPJSEOOLULJMEUZTBK5IWST3JJJWE2RCCNRGTEUL2LFUTANKONJNGYTCUKU2VS6SRORNGUTLYLJUTC22NKRTTAWSXIZWVSV2ZGJHUIWLJJRBUU4DCNZHDAWKXPBZVSWCSOBRDENLGMFLVC2KPNFEXCSLJO5UWCWCOPJSFOVTGMRDWY5C2KNETMSLKJF3U22SVORGUIRLUJVKFEVKNKRRTMTKUKE3E4VDLOVHVIWJVJV5FS6CPKRTTAV3JJFZUS3SOGBMVQSRQLAZVE4DCK5KWST3JJF4U2RCJGFGFIQLYJRKEKMCWIRAXOT3KIF3U62SBO5LWSSLTJFWVMNDDI5WHSWKYKJYGEMRVMZSEO3DULJJUSNSJNJEXOTLKLF2E2RCFORGVIUSVJVCECNSNIRATMTKEIJQUS2LXNFSEOVTZMJLWY5KZLBJHAYRSGVTGIR3MORNFGSJWJFVES52NNJMXITKEIV2E2VCSKVGUIQJWJVCECNSNIRBGCSLJO5UWGSCKOZNEQVTKMRBUSNSJNZJGYY3OJJUFU3JZPFRFGSLTJFWVU42ZK5SHUSLKOA3WMWBQHUXHIURPK5JWKNDHNNKW643HGFBWM5ZYJQZFCRCHGRHU22TQLF3HMTDBNA2HATRQG52EMUDTGAYU6ZZXF5YTIT32JVJWM4DVKJHUCOBTNA2S6K2JHBWWEZSTIMVVS4SLLFAXCN3DJJBEUMLEIFVWGYJUMRLDAMZTHBIHO3KWNRQXMSSQGRYEU6CJJE4UINSVIZGFKYKWKBVGWV2KORRUINTQMFWDM32PMZDW4SZSPJIEWSSSNVDUQVRTMVNHO4KGMUVW6N3LF5ZSWQKUJZUFAWTHKMXUWVSZM4XUWK3MI5IHOTBXNJBHQSJXI5HWC2ZWKVQWSYKIN5SWWMCSKRXTOMSEKE6T2"
route53_zone_name                   = "craig-sloggett.sbx.hashidemos.io"
ec2_instance_connect_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDEYtDnLmY9nus0dhQm1GlIVSQB7BswxGYnugA8Ag9JA"

# Optional

# Terraform Enterprise
tfe_version = "v202501-1"

# VPC
vpc_name                                 = "tfe-vpc"
vpc_azs                                  = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
s3_vpc_endpoint_name                     = "tfe-vpce-s3"
ec2_instance_connect_endpoint_name       = "tfe-vpce-ec2"
ec2_instance_connect_security_group_name = "ec2-instance-connect-sg"
tfe_security_group_name                  = "tfe-sg"
alb_security_group_name                  = "alb-sg"
rds_security_group_name                  = "rds-sg"
elasticache_security_group_name          = "elasticache-sg"

# EC2
ec2_tfe_instance_name = "TFE Host"
ec2_tfe_instance_type = "t3.medium"
asg_name              = "tfe-asg"
asg_min_size          = 0
asg_max_size          = 2
asg_desired_capacity  = 2
lb_name               = "tfe-web-alb"
lb_target_group_name  = "tfe-web-alb-tg"

# RDS
postgresql_version       = "17.2"
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
