terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.50.0"
    }
  }

  backend "s3" {
    bucket         = "dayos-loggers-lambda"
    key            = "terraform/aws/erply.tfstate"
    region         = "us-east-1"
    dynamodb_table = "LoggingData"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "Dev"
    }
  }
}