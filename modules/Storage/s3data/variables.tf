variable "Default_Tags" {
description = "Mapping of tags to assign to the resource"
}
variable "S3_Data_Bucket_name" {
  description = "Provide the profile name where credentails are stored"
}
variable "S3_Prefix" {
 description = "Prefix for s3 data bucket"
}
variable "S3_Enable_Versioning" {
  description = "Specify if we need to enable versioning for s3 bucket"
}
variable "S3_LogBucket_Id" {
  description = "Specify the name of s3 log bucket"
}
variable "S3_KMS_Key_Secret" {
  description = "Specify kms key used for encrypting s3 bucket"
}
