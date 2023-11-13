# Resource block for the S3 bucket to store Weasel CRM assets
resource "aws_s3_bucket" "weasel_s3" {
  bucket = "${var.common_app_name}-${random_id.bucket_suffix.hex}"

  # Prevent accidental deletion of this S3 bucket by enabling lifecycle settings
  lifecycle {
    prevent_destroy = true
  }

  # Tags for identifying the S3 bucket resource
  tags = {
    Name        = "${var.common_app_name}-S3"
    Environment = var.environment
  }
}

# Resource block for enabling versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "weasel_s3_versioning" {
  bucket = aws_s3_bucket.weasel_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}


# Resource block for configuring server-side encryption on the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "weasel_s3_encryption" {
  bucket = aws_s3_bucket.weasel_s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Resource block for blocking public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "weasel_s3_public_access_block" {
  bucket                  = aws_s3_bucket.weasel_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Resource block for creating a unique identifier for the S3 bucket
resource "random_id" "bucket_suffix" {
  keepers = {
    id = "${var.common_app_name}-S3-Bucket"
  }

  byte_length = 8 # Generates a random 8-byte (16-character) hexadecimal string
}
