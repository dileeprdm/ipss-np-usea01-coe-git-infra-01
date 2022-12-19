variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "Subnet_ID_AZ1" {
  description = "Provide AZ1 Availability Zone trusted subnet ID"
}
variable "Subnet_ID_AZ2" {
  description = "Provide AZ2 Availability Zone trusted subnet ID"
}
variable "NLB_Name" {
  description = "Name of the Load Balancer"
}
variable "NLB_Internal" {
  description = "Specify if NLB is internal or external"
}
variable "NLB_Type" {
  description = "Specify Type of load balancer to deploy"
}
variable "NLB_Access_Logs_Enable" {
  description = "Specify if access logs needs to be enabled for the load balancer"
}
variable "NLB_Access_Logs_Prefix" {
  description = "Specify prefic path to store access logs for the load balancer"
}
variable "S3_Log_Bucket_ID" {
  description = "provide S3 Log bucket ID to store logs"
}
variable "NLB_Cross_Zone" {
  description = "Specify if cross zone load balancing needs to be enabled"
}
variable "Deletion_Protection" {
  description = "Specify if deletion protection needs to be enabled for the resource"
}


