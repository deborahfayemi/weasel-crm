# Configure the AWS Provider with the required version and region
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Indicates the source of the AWS provider
      version = "~> 3.0"        # Pinning the provider version to ensure compatibility
    }
  }

  required_version = ">= 0.13" # Minimum Terraform version required for this module
}

provider "aws" {
  region = var.region # AWS region where resources will be created
}
