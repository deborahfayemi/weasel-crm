# Weasel Infrastructure Terraform Module

## Overview

The `weasel_infra` Terraform module is designed to provision a full AWS infrastructure setup, including EC2 instances, RDS databases, S3 buckets, security groups, and SSH key pairs. This module is ideal for setting up a production-grade environment on AWS with best practices for security and scalability.

## Features

- **EC2 Instances**: Configures and launches EC2 instances with attached EBS volumes.
- **RDS Databases**: Establishes RDS database instances, complete with configuration options for storage, engine, and multi-AZ deployment.
- **S3 Buckets**: Implements S3 buckets with versioning, server-side encryption, and public access blocks.
- **Security Groups**: Manages security groups for EC2, RDS, and Application Load Balancers, ensuring secure access.
- **SSH Key Pair**: Generates an SSH key pair for secure access to EC2 instances.
- **Load Balancer**: Sets up an Application Load Balancer with target groups and listeners for handling incoming web traffic.

## Module Structure

- `data.tf`: Data sources for AWS availability zones and internet gateways.
- `ec2.tf`: Configuration for EC2 instances, including EBS volume attachments and public IP association.
- `outputs.tf`: Output definitions for resource identifiers like EC2 IDs and S3 bucket names.
- `provider.tf`: AWS provider configuration with version constraints.
- `rds.tf`: Resource definitions for RDS database instances.
- `s3.tf`: Configuration for S3 buckets, including versioning, encryption, and access control settings.
- `sg.tf`: Security group definitions for web, database, and ALB access.
- `lb.tf`: Load balancer setup, including target groups and listener configurations.
- `route.tf`: Route table configurations for public subnet associations.
- `subnets.tf`: Creation of public and private subnets.
- `variables.tf`: Variable declarations used throughout the module.

## Prerequisites

- Terraform installed (v0.13 or higher).
- An AWS account with the necessary permissions to create the resources.
- AWS CLI configured with credentials.

## Usage

To use this module in your Terraform project, create a `main.tf` file in the root of your project directory and define the module source along with any required variables.

### Example `main.tf`

```hcl
module "weasel_infra" {
  source = "./template"

  # Define required variables here
  region            = "us-east-1"
  environment       = "production"
  common_app_name   = "weaselapp"
  # ... other variables
}

