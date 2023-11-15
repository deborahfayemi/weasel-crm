resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.public_route_cidrs
    content {
      cidr_block = route.value
      gateway_id = data.aws_internet_gateway.existing_igw.id
    }
  }

  tags = {
    Name = "${var.common_app_name}-public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

