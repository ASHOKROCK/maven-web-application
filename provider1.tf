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
  access_key = "AKIA3FLD5IHK2AELHAO7"
  secret_key = "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"
  region = "us-east-1"
}

