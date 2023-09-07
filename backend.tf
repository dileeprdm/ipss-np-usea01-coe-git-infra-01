
terraform {
  backend "s3" {
    bucket = "s3b-np-usea01-ipss-coe-tfstate-01"
    key = "cicd/dev_infra/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}


