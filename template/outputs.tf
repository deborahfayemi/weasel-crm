output "ec2_instance_ids" {
  value = aws_instance.weasel_ec2[*].id
}

output "rds_endpoint" {
  value = aws_db_instance.weasel_db.address
}

output "s3_bucket_name" {
  value = aws_s3_bucket.weasel_s3.bucket
}

output "alb_arn" {
  value = aws_lb.weasel_alb.arn
}

output "alb_dns_name" {
  value = aws_lb.weasel_alb.dns_name
}
