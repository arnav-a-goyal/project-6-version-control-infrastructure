
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "aws_caller_identity" "current" {}

# Create IAM User
resource "aws_iam_user" "s3_reader" {
  name = var.iam_user_name

  tags = {
    Project   = "Project4"
    ManagedBy = "Terraform"
  }
}

# Create custom IAM policy
resource "aws_iam_policy" "s3_read_only" {
  name        = var.iam_policy_name
  description = "Read-only access to the specified S3 bucket"

  policy = jsonencode(var.s3_read_policy)

  tags = {
    Project   = "Project4"
    ManagedBy = "Terraform"
  }
}

# Attach policy to IAM user
resource "aws_iam_user_policy_attachment" "s3_reader" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}
