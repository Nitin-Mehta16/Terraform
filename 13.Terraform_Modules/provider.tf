terraform {
  required_version = ">1.1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }

  # backend "s3" {
  #   bucket = "terraform-testinggg"
  #   region = "ap-south-1"
  #   key = "terraform.tfstate"
  #   dynamodb_table = "terraform-lock"
  # }

}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}