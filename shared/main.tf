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
  region = "us-east-1"
}

variable "prefix" {}

module "s3_bucket_external" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "chaim-delete-me-${var.prefix}-my-s3-bucket"
  versioning = {
    enabled = true
  }
}
