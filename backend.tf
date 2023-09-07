
terraform {
  backend "s3" {
    bucket = "s3b-np-usea01-ipss-coe-tfstate-01"
    key = "cicd/dev_infra/terraform.tfstate"
    region = "us-east-1"
    profile = "IOT"
    access_key = "AKIA2F22NE445HI3OGCT"
    secret_key = "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"
  }
}


