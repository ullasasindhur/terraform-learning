terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.31.0"
    }
  }
  required_version = "~>1.2.9"
  backend "s3" {
    bucket         = "ullasasindhur"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ullasasindhur"
  }
}
