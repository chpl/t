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
  count  = 2
  bucket = "${var.prefix}-module1-${count.index}"
  tags = {
    Drift = "${var.drift}-tag"
  }
}
