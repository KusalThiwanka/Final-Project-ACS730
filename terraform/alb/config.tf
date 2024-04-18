terraform {
  backend "s3" {
    bucket = "kusal-project"
    key    = "alb/terraform.tfstate"
    region = "us-east-1"
  }
}