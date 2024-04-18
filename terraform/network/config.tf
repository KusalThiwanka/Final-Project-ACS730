terraform {
  backend "s3" {
    bucket = "kusal-project"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}