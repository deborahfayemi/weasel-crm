# Dynamic creation of multiple public subnets
resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.common_app_name}-public-subnet-${count.index}"
  }
}

# Dynamic creation of multiple private subnets
resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.common_app_name}-private-subnet-${count.index}"
  }
}

resource "aws_db_subnet_group" "weasel_db_subnet_group" {
  name       = "${var.common_app_name}-db-subnet-group"
  subnet_ids = aws_subnet.private_subnet[*].id

  tags = {
    Name = "${var.common_app_name}-db-subnet-group"
  }
}
