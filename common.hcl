remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "env0-tf-remote-backend-bucket"
    key    = ""
    region = "us-east-1"
  }
}