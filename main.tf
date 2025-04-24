terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}


resource "aws_s3_bucket" "this" {
    bucket = "chaim-delete-me-s3-bucket"
}

resource "aws_s3_bucket_versioning" "this" {
  bucket                = aws_s3_bucket.this.id

  versioning_configuration {
    # Valid values: "Enabled" or "Suspended"
    status = "Enabled"
  }
}
