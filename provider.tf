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
  access_key = "AKIAYQC7O6VF5MMPO7UT"
  secret_key = "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"
  region = "us-east-1"
}

