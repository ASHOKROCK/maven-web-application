terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key = "AKIAZFQV5VJY73FLNHDJ"
  secret_key = "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"
  region = "us-east-1"
}

