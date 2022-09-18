terraform {
  backend "s3" {
    bucket = "terra-back-end"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}