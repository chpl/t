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
  alias  = "us-east-1"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us-west-2"
}

resource "aws_s3_bucket" "chaim-multi-region-east" {
  provider = aws.us-east-1
  bucket   = "chaim-multi-region-east"
}

resource "aws_iam_role" "chaim-multi-region-east" {
  provider = aws.us-east-1
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
  provider = aws.us-west-2
  bucket   = "chaim-multi-region-west"
}

resource "aws_iam_role" "chaim-multi-region-west" {
  provider = aws.us-west-2
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

module "east" {
  providers = {
    aws = aws.us-east-1
  }
  source      = "./module"
  name_suffix = "module-east"
}

module "west" {
  providers = {
    aws = aws.us-west-2
  }
  source      = "./module"
  name_suffix = "module-west"
}