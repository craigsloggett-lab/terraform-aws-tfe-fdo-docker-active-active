resource "aws_cloudwatch_log_group" "tfe_rds_postgresql" {
  name = "/aws/rds/instance/${var.rds_instance_name}/postgresql"
}

resource "aws_cloudwatch_log_group" "tfe_rds_upgrade" {
  name = "/aws/rds/instance/${var.rds_instance_name}/upgrade"
}
