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

module "external_module2" {
  source = "terraform-aws-modules/s3-bucket/aws//wrappers"

  defaults = { # Default values
    create = true
    tags = {
      Drift = "${var.drift}-tag"
    }
  }

  items = {
    my_bucket = {
      bucket = "${var.prefix}-module2-external-module"
    }
  }
}