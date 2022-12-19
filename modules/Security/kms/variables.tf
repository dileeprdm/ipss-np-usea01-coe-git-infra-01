variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "KMS_Deletion_Window_In_Days" {
  description = "Specify kms Key deletion window in days"
}
variable "KMS_Enable_Key_Rotation" {
  description = "Specify if kms Key needs to be rotated"
}

variable "KMS_Key_Policy" {
  default = ""
}
variable "KMS_Key_Alias" {
  description = "Provide dynamodb Key alias name"
}


