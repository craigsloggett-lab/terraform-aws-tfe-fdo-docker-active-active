data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_route53_zone" "tfe" {
  name = var.route53_zone_name
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_kms_key" "rds" {
  key_id = "alias/aws/rds"
}

data "aws_kms_key" "secretsmanager" {
  key_id = "alias/aws/secretsmanager"
}

data "aws_kms_key" "ssm" {
  key_id = "alias/aws/ssm"
}

locals {
  account_id                = data.aws_caller_identity.current.account_id
  region                    = data.aws_region.current.name
  bucket_name               = "${local.account_id}-${local.region}-terraform-enterprise"
  my_ip                     = chomp(data.http.myip.response_body)
  route53_alias_record_name = "${var.tfe_subdomain}.${var.route53_zone_name}"
}

resource "random_string" "tfe_encryption_password" {
  length = 256
}

resource "random_string" "tfe_database_password" {
  length = 64
}

resource "random_string" "tfe_redis_password" {
  length  = 128
  special = false # The Redis auth token doesn't accept special characters.
}
