terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    null = {
      source  = "hashicorp/null"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "main"
}

provider "aws" {
  region = "us-west-2"
  alias  = "secondary"
}

resource "aws_s3_bucket" "chaim-multi-region-east" {
  provider = aws.main
  bucket   = "chaim-multi-region-east"
}

resource "aws_iam_role" "chaim-multi-region-east" {
  provider = aws.main
  name     = "chaim-multi-region-east"
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

resource "aws_s3_bucket" "chaim-multi-region-west" {
  provider = aws.secondary
  bucket   = "chaim-multi-region-west"
}

resource "aws_iam_role" "chaim-multi-region-west" {
  provider = aws.secondary
  name     = "chaim-multi-region-west"
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

resource "aws_api_gateway_rest_api" "chaim-multi-region-east" {
    provider = aws.main
    name     = "chaim-multi-region-east"
}

resource "aws_api_gateway_rest_api" "chaim-multi-region-west" {
    provider = aws.secondary
    name     = "chaim-multi-region-west"
}

module "east" {
  providers = {
    aws.this = aws.main
  }
  source      = "./module"
  name_suffix = "module-east"
}

module "west" {
  providers = {
    aws.this = aws.secondary
  }
  source      = "./module"
  name_suffix = "module-west"
}