# Configure the AWS Provider with the required version and region
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Automatically use the latest AWS provider version in the 5.x line
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0" # Automatically use the latest random provider version in the 3.x line
    }
  }
  required_version = ">= 0.13" # The minimum required Terraform version
}

provider "aws" {
  region = var.region
}
