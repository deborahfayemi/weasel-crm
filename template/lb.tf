resource "aws_lb" "weasel_alb" {
  name               = "${var.common_app_name}-alb"
  internal           = var.alb_internal
  load_balancer_type = var.alb_load_balancer_type
  security_groups    = [aws_security_group.weasel_alb_sg.id]
  subnets            = [for subnet in aws_subnet.public_subnet : subnet.id]

  tags = {
    Name = "${var.common_app_name}-ALB"
  }
}

resource "aws_lb_target_group" "weasel_alb_tg" {
  name     = "${var.common_app_name}-alb-tg"
  port     = var.alb_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = var.alb_health_check_interval
    path                = var.alb_health_check_path
    protocol            = "HTTP"
    matcher             = var.alb_health_check_matcher
    timeout             = var.alb_health_check_timeout
    healthy_threshold   = var.alb_health_check_healthy_threshold
    unhealthy_threshold = var.alb_health_check_unhealthy_threshold
  }

  tags = {
    Name = "${var.common_app_name}-ALB-TG"
  }
}

resource "aws_lb_listener" "weasel_alb_listener" {
  load_balancer_arn = aws_lb.weasel_alb.arn
  port              = var.alb_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.weasel_alb_tg.arn
  }
}
