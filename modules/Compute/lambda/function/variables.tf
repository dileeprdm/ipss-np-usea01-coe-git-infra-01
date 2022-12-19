variable "Default_Tags" {
description = "Mapping of tags to assign to the resource"
}
variable "Lambda_Runtime" {
 description = "Specify runtime for lambda function"
}
variable "Lambda_Loggroup_Retention" {
 description = "Specify retention period for log groups"
}
variable "Lambda_S3bucket" {
 description = "specify s3 bucket contains zip code"
}
variable "Lambda_S3key" {
 description = "Specify path in s3 bucket contains zip code"
}
variable "Lambda_Zip_File_Path" {
  description = "specify s3 bucket  zip file path"
}
variable "Lambda_Cloudwatch_LogGroup_Name" {
  description = "Cloudwatch Log Group Name"
}
variable "Lambda_Function_Name" {
  description = "Lambda Function Name"
}
variable "Lambda_Function_Handler" {
  description = "Lambda Function Handler"
}
variable "Lambda_Memory_Size" {
  description = "Lambda Function Memory_Size"
}
variable "Lambda_Timeout" {
  description = "Lambda Function Timeout"
}
variable "Lambda_Subnet_ID_1A" {
  description = "Lambda Function Subnet_ID"
}
variable "Lambda_Subnet_ID_1B" {
  description = "Lambda Function Subnet_ID"
}

variable "VPC_ID" {
  description = "Provide VPC ID in which resouces will be hosted"
}

variable "Lambda_Env" {
  description = "Environment for Lambda function"
}
variable "IAM_Role_Lambda_function" {
  description = "IAM Role for Lambda Function"
}
variable "Lambda_SG_Name" {
  description = "Load balancer Security Group Name"
}


