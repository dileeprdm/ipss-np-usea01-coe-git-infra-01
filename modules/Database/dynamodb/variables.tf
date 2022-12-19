variable "DynamoDB_Table_Name" {
  description = "Name of Dynamo DB Table"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}

variable "DynamoDB_Table_Billing_Mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED."
}
variable "DynamoDB_Table_Hash_Key" {
  description = "(Required, Forces new resource) The attribute to use as the hash (partition) key. Must also be defined as an attribute,"
}
variable "DynamoDB_Point_InTime_Recovery" {
  description = "(Required) Whether to enable point-in-time recovery - note that it can take up to 10 minutes to enable for new tables. If the point_in_time_recovery block is not provided then this defaults to false."
}
variable "DynamoDB_Table_Enable_Encryption" {
  description = "(Required) Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)."
}
variable "KMS_Key_DynamoDB" {
  description = "(Optional) The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb."
}
variable "DynamoDB_Table_Range_Key" {
  description = "(Optional) The name of the range key; must be defined"
}
variable "DynamoDB_Table_attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties: name - (Required) The name of the attribute, type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = list(map(string))
  default     = []
}
variable "DynamoDB_Table_global_secondary_indexes" {
  description = "Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc."
  type        = list(any)
  default     = []
}
variable "DynamoDB_Table_Read_Capacity" {
  description = "Specify Read Capacity"
}
variable "DynamoDB_Table_Write_Capacity" {
  description = "Specify Write Capacity"
}
variable "DynamoDB_Table_Stream_Enabled" {
  description = "Specify If Stream Needs to be enabled"
}
variable "DynamoDB_Table_Stream_View_type" {
  description = "Specify Stream View Type"
}
variable "DynamoDB_Table_ttl_enabled" {
  description = "Specify if Time to Live enabled"
}
variable "DynamoDB_Table_ttl_attribute_name" {
  description = "Specify TTL Attribute Name"
}
