terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "prefix" {
  default = "chaim-deleteme"
}

resource "aws_s3_bucket" "root" {
  bucket = "${var.prefix}-root-module"
}

resource "aws_s3_bucket_versioning" "root" {
  bucket = aws_s3_bucket.root.id
  versioning_configuration {
    status = "Enabled"
  }
}

module "module1" {
  source = "./module1"
  prefix = var.prefix
}
