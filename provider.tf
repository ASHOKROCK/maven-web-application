terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7G3MYDYYABM63MQ"
  secret_key = "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"
}
