terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
access_key = "your-access-key-id"
secret_key = "your-secret-access-key"
 region = "ap-south-1"
}
