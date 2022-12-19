variable "s3_Log_Bucket_name" {
  description = "Provide the profile name where credentails are stored"
}

variable "Default_Tags" {
description = "Mapping of tags to assign to the resource"
}

variable "AWS_Account_Number" {
  description = "Provide the AWS account number in which resources will be hosted"
}
variable "S3_SSE_Algorithm" {
  description = "Provide S3 server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
}
variable "S3_Lifecycle_Rule_Status" {
  description = "Specifies S3 lifecycle rule enabled status"
}
variable "S3_Lifecycle_Rule_Expiration_Days" {
  description = "Specifies the number of days after object creation when the specific rule action takes effect"
}
variable "S3_Block_Public_ACLs" {
  description = "Specify if S3 block public acls needs to be enabled"
}
variable "S3_Block_Public_Policy" {
  description = "Specify if S3 block public policy needs to be enabled"
}
variable "S3_Ignore_Public_ACLs" {
  description = "Specify if S3 ignore public acls needs to be enabled"
}
variable "S3_Restrict_Public_Buckets" {
  description = "Specify if S3 restrict public buckets needs to be enabled"
}

