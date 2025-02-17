module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = var.vpc_azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  default_network_acl_egress = [{
    "action" : "allow",
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_no" : 100, "to_port" : 0
  }]

  default_network_acl_ingress = [{
    "action" : "allow",
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_no" : 100, "to_port" : 0
  }]
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.ca-central-1.s3"

  tags = {
    Name = var.s3_vpc_endpoint_name
  }
}

resource "aws_vpc_endpoint_route_table_association" "public" {
  route_table_id  = module.vpc.public_route_table_ids[0]
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

resource "aws_vpc_endpoint_route_table_association" "private" {
  route_table_id  = module.vpc.private_route_table_ids[0]
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

# Bastion Security Group

resource "aws_security_group" "bastion" {
  name        = var.ec2_bastion_security_group_name
  description = "Bastion Host Security Group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.ec2_bastion_security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "bastion_ssh" {
  security_group_id = aws_security_group.bastion.id
  description       = "Allow SSH traffic ingress to the Bastion Host from a single IP."

  cidr_ipv4   = "${local.my_ip}/32"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "bastion" {
  security_group_id = aws_security_group.bastion.id
  description       = "Allow all outbound traffic from the Bastion Host."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# TFE Instances Security Groups

resource "aws_security_group" "tfe" {
  name        = var.tfe_security_group_name
  description = "TFE Hosts Security Group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.tfe_security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "tfe_https" {
  security_group_id = aws_security_group.tfe.id
  description       = "Allow HTTPS traffic ingress to the TFE Hosts from all networks."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
}

resource "aws_vpc_security_group_ingress_rule" "tfe_ssh" {
  security_group_id = aws_security_group.tfe.id
  description       = "Allow SSH traffic ingress to the TFE Hosts from private subnets."

  cidr_ipv4   = "10.0.0.0/16"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "tfe_vault" {
  security_group_id = aws_security_group.tfe.id
  description       = "Allow Vault traffic ingress to the TFE Hosts from private subnets."

  cidr_ipv4   = "10.0.0.0/16"
  ip_protocol = "tcp"
  from_port   = 8201
  to_port     = 8201
}


resource "aws_vpc_security_group_egress_rule" "tfe" {
  security_group_id = aws_security_group.tfe.id
  description       = "Allow all outbound traffic from the TFE Hosts."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# Application Load Balancer Security Group

resource "aws_security_group" "alb" {
  name        = var.alb_security_group_name
  description = "Application Load Balancer Security Group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.alb_security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow HTTPS traffic ingress to the application load balancer from all networks."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
}

resource "aws_vpc_security_group_egress_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow all outbound traffic from the application load balancer."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# RDS Security Group

resource "aws_security_group" "rds" {
  name        = var.rds_security_group_name
  description = "RDS Security Group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.rds_security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds" {
  security_group_id = aws_security_group.rds.id
  description       = "Allow DB traffic ingress to the RDS hosts from private subnets."

  cidr_ipv4   = "10.0.0.0/16"
  ip_protocol = "tcp"
  from_port   = 5432
  to_port     = 5432
}

resource "aws_vpc_security_group_egress_rule" "rds" {
  security_group_id = aws_security_group.rds.id
  description       = "Allow all outbound traffic from the RDS hosts."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# ElastiCache Security Group

resource "aws_security_group" "elasticache" {
  name        = var.elasticache_security_group_name
  description = "ElastiCache Security Group"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.elasticache_security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "elasticache" {
  security_group_id = aws_security_group.elasticache.id
  description       = "Allow cache traffic to the ElastiCache instance from private subnets."

  cidr_ipv4   = "10.0.0.0/16"
  ip_protocol = "tcp"
  from_port   = 6379
  to_port     = 6379
}

resource "aws_vpc_security_group_egress_rule" "elasticache" {
  security_group_id = aws_security_group.elasticache.id
  description       = "Allow all outbound traffic from the ElastiCache instance."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
