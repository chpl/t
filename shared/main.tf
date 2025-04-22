variable "prefix" {}

module "s3_bucket_external" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "chaim-delete-me-${var.prefix}-my-s3-bucket"
  versioning = {
    enabled = true
  }
}
