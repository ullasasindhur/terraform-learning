terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.31.0"
    }
  }
  required_version = "~>1.2.9"
  backend "remote" {
    organization = "ullasasindhur"
    workspaces {
      name = "dev"
    }
  }
}
