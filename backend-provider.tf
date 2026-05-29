terraform {
  backend "s3" {
    bucket = "wakatech-state-files"
    key    = "infra-provisioners/vpc.tfstate"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.15.1"
    }
  }
}

provider "aws" {
  region              = local.region
  allowed_account_ids = [580280079378]
}