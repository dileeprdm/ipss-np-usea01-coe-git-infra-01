provider "aws" {
  region = "us-east-1"
  #profile = "IoT"
}

terraform {
  backend "s3" {
    encrypt = false
    bucket = "s3b-np-usea01-ipss-coe-tfstate-01"
    key = "cicd/git/dv/terraform.tfstate"
    region = "us-east-1"
    profile = "IoT"
  }
}