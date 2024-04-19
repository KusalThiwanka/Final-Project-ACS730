# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">=0.14"
}

provider "aws" {
  region  = var.region
}

resource "aws_s3_object" "folder" {
  count   = length(var.folder_names)
  bucket  = aws_s3_bucket.my_bucket.id
  key     = "${var.folder_names[count.index]}/"
  content = ""
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}