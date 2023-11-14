data "aws_vpc" "selected" {
  count = var.use_default_vpc ? 0 : 1
  tags = {
    Name = var.vpc_tag_name
  }
}

data "aws_vpc" "default" {
  count   = var.use_default_vpc ? 1 : 0
  default = true
}

data "aws_subnet_ids" "selected_subnets" {
  count  = var.use_default_vpc ? 0 : 1
  vpc_id = data.aws_vpc.selected[0].id
}

data "aws_subnet_ids" "default_subnets" {
  count  = var.use_default_vpc ? 1 : 0
  vpc_id = data.aws_vpc.default[0].id
}
