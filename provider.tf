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
  access_key = "AKIAX5MOH3QABTMELG3I"
  secret_key = "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"
  region = "us-east-1"
}

