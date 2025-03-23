terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "prefix" {}

resource "aws_s3_bucket" "module2" {
  bucket   = "${var.prefix}-module2"
}

resource "aws_s3_bucket_website_configuration" "module" {
  bucket   = aws_s3_bucket.module2.bucket

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

module "s3_bucket_module2" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-module1-external-module"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}