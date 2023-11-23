provider "aws" {
  region = var.AWS_Region
  profile = var.Terraform_Profile
  shared_credentials_file = "~/.aws/credentials"
  #profile = "IOT"
}

