# Resource block for the key pair
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "${var.common_app_name}-key"
  public_key = file(var.public_key_path)
}

# Resource block for creating EC2 instances
resource "aws_instance" "weasel_ec2" {
  count         = var.ec2_instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key_pair.key_name

  subnet_id = var.use_default_vpc ? element(tolist(data.aws_subnet_ids.default_subnets.ids), count.index) : element(tolist(data.aws_subnet_ids.selected_subnets.ids), count.index)


  #attach ebs volume to ec2
  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }

  # error checking(makes sure new ec2 is created before destroying old)
  lifecycle {
    create_before_destroy = true
  }

  # The tag block assigns a name to the EC2 instance using a count index to ensure uniqueness
  tags = {
    Name        = "${var.common_app_name}-EC2-${count.index}"
    Environment = var.environment
  }
}
