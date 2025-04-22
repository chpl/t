terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

variable "prefix" {}


resource "aws_s3_bucket" "this" {
    bucket = "chaim-delete-me-${var.prefix}-my-s3-bucket"
}
moved {
  from = module.s3_bucket_external.aws_s3_bucket.this[0]
  to   = aws_s3_bucket.this
}

resource "aws_s3_bucket_versioning" "this" {
  bucket                = aws_s3_bucket.this.id

  versioning_configuration {
    # Valid values: "Enabled" or "Suspended"
    status = "Enabled"
  }
}

moved {
  from = module.s3_bucket_external.aws_s3_bucket_versioning.this[0]
  to   = aws_s3_bucket_versioning.this
}
