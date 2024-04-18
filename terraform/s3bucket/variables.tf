variable "profile" {
  default     = "default"
  type        = string
  description = "AWS Profile"
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS Region"
}

variable "bucket_name" {
  default     = "kusal-project"
  type        = string
  description = "S3 Bucket Name"
}

variable "folder_names" {
  default     = ["network", "webservers", "alb"]
  type        = list(string)
  description = "S3 Bucket Folder Names"
}