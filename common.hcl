generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "env0-tf-remote-backend-bucket"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    disable_bucket_update = true
  }

  disable_init          = true
}