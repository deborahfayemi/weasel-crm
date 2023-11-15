# Resource block for creating EC2 instances
resource "aws_instance" "weasel_ec2" {
  count         = var.ec2_instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key_pair.key_name

  # Distribute instances across the available public subnets
  subnet_id = aws_subnet.public_subnet[count.index % length(aws_subnet.public_subnet)].id

  vpc_security_group_ids = [aws_security_group.weasel_sg_web.id]

  # Attach a public IP to each instance
  associate_public_ip_address = var.ec2_associate_public_ip_address

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
