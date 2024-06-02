provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "lourash-terraform-state-bucket"
    key            = "health-tracking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
