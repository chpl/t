remote_state {
  backend = "s3"
  config = {
    bucket = "env0-tf-remote-backend-bucket"
    key    = ""
    region = "us-east-1"
  }
}