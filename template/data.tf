data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_internet_gateway" "existing_igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}
