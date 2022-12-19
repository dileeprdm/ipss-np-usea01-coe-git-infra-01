resource "aws_s3_bucket_object" "S3_Lambda_Zipcode" {
  bucket = var.Lambda_S3bucket
  key    = var.Lambda_S3key
  source     = var.Lambda_Zip_File_Path
}

resource "aws_lambda_function" "Lambda" {
  s3_bucket        = aws_s3_bucket_object.S3_Lambda_Zipcode.bucket
  s3_key           = aws_s3_bucket_object.S3_Lambda_Zipcode.key
  function_name = var.Lambda_Function_Name
  role          = var.IAM_Role_Lambda_function
  handler       = var.Lambda_Function_Handler
  runtime = var.Lambda_Runtime
  memory_size = var.Lambda_Memory_Size
  timeout = var.Lambda_Timeout
  vpc_config {
    security_group_ids = [var.Lambda_SG_Name]
    subnet_ids = [var.Lambda_Subnet_ID_1A]
  }
environment {
    variables = {
      NODE_ENV = var.Lambda_Env
    }
}
    tags = merge(var.Default_Tags, tomap({Name=var.Lambda_Function_Name}))
}