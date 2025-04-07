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

variable "drift" {
  default = ""
}

resource "aws_s3_bucket" "root" {
  bucket = "${var.prefix}-root-module"
  tags = {
    Drift = "${var.drift}-tag"
  }
}

module "module1" {
  source = "./module1"
  prefix = var.prefix
  drift  = var.drift
}


# updated by env0 cloud to code
module "external_root" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-root-external-module"
  tags = {
    Drift = "${var.drift}-tag"
  }
}