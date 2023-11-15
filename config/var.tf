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

variable "public_key_path" {
  description = "Path to the public key to be used for SSH access"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
  type        = string
}

variable "ingress_cidr_blocks_web" {
  description = "CIDR blocks for web ingress traffic."
  type        = list(string)

}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)

}

variable "ingress_cidr_blocks_ssh" {
  description = "CIDR blocks for EC2 ssh ingress traffic"
  type        = list(string)
}

variable "public_subnet_cidr" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}
