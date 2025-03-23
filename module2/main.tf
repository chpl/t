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

resource "aws_s3_bucket" "module2" {
  bucket = "${var.prefix}-module2"
  tags = {
    Drift = "${var.drift}-tag"
  }
}

module "s3_bucket_module2" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-module1-external-module"
  tags = {
    Drift = "${var.drift}-tag"
  }
}