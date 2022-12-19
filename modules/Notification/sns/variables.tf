variable "SNS_Name" {
  description = "Provide the SNS name"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "kms_master_key_id" {
  description = "global kms key to encrypt the sns topic"
}


