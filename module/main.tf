terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "this"
}

variable "name_suffix" {}

resource "aws_s3_bucket" "chaim-multi-region" {
  provider = aws.this
  bucket = "chaim-multi-region-${var.name_suffix}"
}

resource "aws_iam_role" "chaim-multi-region" {
  provider = aws.this
  name = "chaim-multi-region-${var.name_suffix}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

