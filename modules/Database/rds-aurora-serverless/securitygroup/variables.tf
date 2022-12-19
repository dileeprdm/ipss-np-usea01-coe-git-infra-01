variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "App_EnvironmentType" {
  description = "Provide the profile name where credentails are stored"
}
variable "App_AcronymCode" {
  description = "Provide the Application Acronymcode"
}
variable "RDS_SG_Name" {
  description = "Provide the RDS_SG_Name"
}
variable "RDS_Database_Port" {
  description = "Provide RDS database port"
}
variable "EC2_SG_ID" {
  description = "Provide ECS SG permission"
}

variable "App_ClusterCode" {
  description = "Provide the Application ClusterCode"
}

variable "VPC_ID" {
  description = "Provide VPC ID in which resources will be hosted"
}

variable "Securitygroup_Vpc_CIDR" {
  description = "specify vpc CIDR to attach with securitygroup"
}



