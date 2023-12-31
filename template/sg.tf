# Security group for web access - allows HTTP and HTTPS traffic
resource "aws_security_group" "weasel_sg_web" {
  name        = "${var.common_app_name}_sg_web"
  description = "Allow web traffic"
  vpc_id      = var.vpc_id

  # Ingress rules define the incoming traffic to the EC2 instances.
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks_ssh
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks_web
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks_web
  }

  #define the outgoing traffic from the EC2 instances.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allows all outbound traffic. Tighten as needed.
  }
}

# Security group for database access - allows MySQL traffic
resource "aws_security_group" "weasel_sg_db" {
  name        = "${var.common_app_name}_sg_db"
  description = "Allow MySQL traffic"
  vpc_id      = var.vpc_id

  # Only the EC2 instances should have access to the RDS instance.
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.weasel_sg_web.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr_blocks
  }
}

# Security group for the ALB
resource "aws_security_group" "weasel_alb_sg" {
  name        = "${var.common_app_name}-alb-sg"
  description = "Security group for the Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.alb_port
    to_port     = var.alb_port
    protocol    = "tcp"
    cidr_blocks = var.alb_security_group_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.common_app_name}-ALB-SG"
  }
}
