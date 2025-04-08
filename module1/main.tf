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
  count  = 2
  bucket = "${var.prefix}-module1-${count.index}"
}

resource "aws_s3_bucket_versioning" "module1" {
  count  = 2
  bucket = aws_s3_bucket.module1[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}
