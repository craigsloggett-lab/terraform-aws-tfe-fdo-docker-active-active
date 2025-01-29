resource "aws_db_subnet_group" "tfe" {
  name       = var.rds_subnet_group_name
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = var.rds_subnet_group_name
  }
}

resource "aws_db_parameter_group" "tfe" {
  name   = var.rds_parameter_group_name
  family = format("postgres%s", split(".", var.postgresql_version)[0]) # The parameter group family only needs the major version number.

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "1"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "tfe" {
  identifier                      = var.rds_instance_name
  engine                          = "postgres"
  engine_version                  = var.postgresql_version
  instance_class                  = var.rds_instance_class
  db_name                         = var.tfe_database_name
  username                        = var.rds_instance_master_user
  db_subnet_group_name            = aws_db_subnet_group.tfe.name
  vpc_security_group_ids          = [aws_security_group.rds.id]
  multi_az                        = true
  manage_master_user_password     = true
  master_user_secret_kms_key_id   = data.aws_kms_key.secretsmanager.arn
  performance_insights_enabled    = true
  performance_insights_kms_key_id = data.aws_kms_key.rds.arn
  backup_retention_period         = 4
  allocated_storage               = 20
  max_allocated_storage           = 100
  skip_final_snapshot             = true
  copy_tags_to_snapshot           = true
  auto_minor_version_upgrade      = true
  storage_encrypted               = true
  parameter_group_name            = aws_db_parameter_group.tfe.name
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  apply_immediately               = true

  tags = {
    Name = var.rds_instance_name
  }
}
