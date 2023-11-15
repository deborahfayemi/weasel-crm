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

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
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

variable "ec2_volume_type" {
  description = "Type of volume to be attached to the ec2"
  type        = string
  default     = "gp2"
}

variable "ec2_volume_size" {
  description = "Size of volume to be attached to the ec2"
  type        = number
  default     = 100
}

variable "public_key_path" {
  description = "Path to the public key to be used for SSH access"
  type        = string
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
  default     = true
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
  description = "CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_cidr_blocks_ssh" {
  description = "CIDR blocks for EC2 ssh ingress traffic"
  type        = list(string)
}

variable "public_subnet_cidr" {
  description = "CIDR block list for the public subnet"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "CIDR block list for the private subnet"
  type        = list(string)
}

variable "rds_multi_az" {
  description = "Define if the db should be highly available"
  type        = bool
  default     = false
}

variable "public_route_cidrs" {
  description = "List of CIDR blocks for public routes"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_security_group_ingress_cidr_blocks" {
  description = "List of CIDR blocks for ALB ingress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_port" {
  description = "The port on which the ALB listens"
  type        = number
  default     = 80
}

variable "alb_health_check_path" {
  description = "Path for ALB health check"
  type        = string
  default     = "/"
}

variable "alb_internal" {
  description = "Determines if the load balancer is internal"
  type        = bool
  default     = false
}

variable "alb_load_balancer_type" {
  description = "The type of load balancer to create"
  type        = string
  default     = "application"
}

variable "alb_health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}

variable "alb_health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check."
  type        = number
  default     = 5
}

variable "alb_health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = number
  default     = 2
}

variable "alb_health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy."
  type        = number
  default     = 2
}

variable "alb_health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target."
  type        = string
  default     = "200"
}

variable "ec2_associate_public_ip_address" {
  description = "Option to associate ec2 with a public ip address"
  type        = bool
  default     = false
}