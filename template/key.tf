# Resource block for the key pair
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "${var.common_app_name}-key"
  public_key = file(var.public_key_path)
}