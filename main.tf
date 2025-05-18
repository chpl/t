terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 5.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

resource "aws_acm_certificate" "import" {
  certificate_body  = var.certificate_body
  certificate_chain = var.certificate_chain
  private_key       = var.private_key
}

variable "certificate_body" {}
variable "certificate_chain" {}
variable "private_key" {}