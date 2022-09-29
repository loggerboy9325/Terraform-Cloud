terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
    organization = "gwettlaufertest"

    workspaces {
      name = "test-workspace"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
