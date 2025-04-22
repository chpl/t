include "common" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=4.7.0"
  extra_arguments "migrate" {
    commands = [
      "init",
    ]

    arguments = [
      "-migrate-state"
    ]
  }
}

inputs = {
  bucket = "chaim-delete-me-module3-my-s3-bucket"
  versioning = {
    enabled = true
  }
}