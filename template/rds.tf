# Resource block for the RDS MySQL database instance
resource "aws_db_instance" "weasel_db" {
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  storage_type          = var.db_storage_type
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.rds_instance_class

  # Database identifier.
  db_name  = "${var.common_app_name}-db"
  username = var.db_username
  password = var.db_password

  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot

  # Tags.
  tags = {
    Name        = "${var.common_app_name}-RDS"
    Environment = var.environment
  }
}
