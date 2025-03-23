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
variable "drift" {}

resource "aws_s3_bucket" "module1" {
  bucket = "${var.prefix}-module1"
  tags = {
    Drift = "${var.drift}-tag"
  }
}

module "module2" {
  source = "../module2"
  prefix = var.prefix
  drift  = var.drift
}

module "s3_bucket_module1" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-module1-external-module"
  tags = {
    Drift = "${var.drift}-tag"
  }
}