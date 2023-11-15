module "weasel_infra" {
  source = "../template"

  # Pass variables to the module
  region                   = "us-east-1"
  environment              = "poc"
  common_app_name          = "weasel"
  vpc_id                   = var.vpc_id
  public_key_path          = var.public_key_path
  ami_id                   = "ami-0fc5d935ebf8bc3bc"
  instance_type            = "t2.micro"
  ec2_instance_count       = 2
  ec2_volume_type          = "gp2"
  ec2_volume_size          = 100
  rds_instance_class       = "db.t2.micro"
  db_engine_version        = "8.0.34"
  db_storage_type          = "gp2"
  db_engine                = "mysql"
  db_allocated_storage     = 10
  skip_final_snapshot      = false
  parameter_group_name     = "default.mysql8.0"
  db_max_allocated_storage = 100
  db_username              = var.db_username
  db_password              = var.db_password
  ingress_cidr_blocks_web  = var.ingress_cidr_blocks_web
  egress_cidr_blocks       = var.egress_cidr_blocks
  ingress_cidr_blocks_ssh  = var.ingress_cidr_blocks_ssh
  public_subnet_cidr       = var.public_subnet_cidr
  private_subnet_cidr      = var.private_subnet_cidr
}
