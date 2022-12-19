variable "App_EnvironmentType" {
  description = "Provide the profile name where credentails are stored"
}
variable "App_AcronymCode" {
  description = "Provide the Application Acronymcode"
}
variable "App_ClusterCode" {
  description = "Provide the Application ClusterCode"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "KMS_Key_Secret" {
  description = "Provide KMS Key details to be used for secrets"
}
variable "Secret_Manager_Name" {
description = "Provide Secret_Manager_Name"
}
variable "Secret_Recovery_Window_In_Days" {
  description = "Specify the number of days that AWS Secrets Manager waits before it can delete the secret"
}
variable "App_Seqnumber" {
  description = "Provide seq number of lambda function"
}