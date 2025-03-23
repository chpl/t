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

resource "aws_s3_bucket" "module1" {
  bucket   = "${var.prefix}-module1"
}

resource "aws_s3_bucket_website_configuration" "module" {
  bucket   = aws_s3_bucket.module1.bucket

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

module "module2" {
  source = "../module2"
}

module "s3_bucket_module1" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-module1-external-module"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}