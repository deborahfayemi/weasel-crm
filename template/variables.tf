# variables

#general
variable "region" {
  description = "Region resources should/would be deployed"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "What environment this would be deployed"
  type        = string

}

variable "common_app_name" {
  description = "name that is common to all resources defined here"
  type        = string

}

# EC2 instance variables
variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
  type        = string
  default     = "t2.micro"
}

variable "ec2_instance_count" {
  description = "The number of EC2 instances to launch."
  type        = number
  default     = 2
}

# RDS database variables
variable "rds_instance_class" {
  description = "The instance class of the RDS database."
  type        = string
  default     = "db.t2.micro"
}

variable "db_engine_version" {
  description = "The version of the database engine."
  type        = string
  default     = "8.0.34"
}

variable "db_storage_type" {
  description = "The type of the database storage."
  type        = string
  default     = "gp2"
}

variable "db_engine" {
  description = "The version of the database engine."
  type        = string
  default     = "mysql"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance."
  type        = number
  default     = 10
}

variable "skip_final_snapshot" {
  description = "Skips the final snapshot before deleting the DB. For production, set to false."
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "parameter group for DB"
  type        = string
  default     = "default.mysql5.7"

}

variable "db_max_allocated_storage" {
  description = "The maximum storage to which the RDS instance can autoscale."
  type        = number
  default     = 100
}

variable "db_username" {
  description = "The username for the RDS instance."
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the RDS instance."
  type        = string
  sensitive   = true
}


# Security Group variables
variable "ingress_cidr_blocks_web" {
  description = "CIDR blocks for web ingress traffic."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for database ingress traffic."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
