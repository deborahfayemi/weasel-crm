# Resource block for creating EC2 instances
resource "aws_instance" "weasel_ec2" {
  count         = var.ec2_instance_count                
  ami           = var.ami_id 
  instance_type = var.instance_type

  # The tag block assigns a name to the EC2 instance using a count index to ensure uniqueness
  tags = {
    Name = "${var.common_app_name}-EC2-${count.index}"
    Environment = var.environment
  }
}
