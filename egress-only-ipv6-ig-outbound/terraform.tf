terraform {
  required_version = ">=1.3.0"

  cloud {
    organization = "AWS-TF-GH-CODESPACE"
    workspaces {
      name = "AWS-NW"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {

  region = var.region

}