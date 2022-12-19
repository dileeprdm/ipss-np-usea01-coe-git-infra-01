###################EC2##################################

variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "Securitygroup_EC2_Name" {
  description = "specify Securitygroup_EC2_Name to attach with securitygroup"
}
variable "Securitygroup_Vpc_Id" {
  description = "specify vpc id to attach with securitygroup"
}
variable "Securitygroup_Vpc_CIDR" {
  description = "specify vpc CIDR to attach with securitygroup"
}
variable "Securitygroup_Port" {
  description = "specify security group port"
}

variable "ApplicationName" {
  default = ""
}


/*variable "KMS_Key_EC2" {
  description = "Specify KMS_Key_EC2"
}*/

variable "Secgroupname_Description" {
  default = ""
}

variable "Subnet_ID_AZ1_Private" {
  description = "Provide eu-west-1a(AZ1) Availability Zone Subnet_ID_AZ1_Private subnet ID"
}



#########################IAM############################################

variable "instance-profile_name" {
  description = "Specify instance-profile."
}
variable "instance-role_name" {
  description = "Specify instance-role"
}
variable "Server_Name" {
  default = ""
}
variable "EC2_User_Data_Path" {
  default = ""
}

variable "instance_type" {
  description = "Specify the instance_type."
}

variable "ssh_key_name" {
  description = "Specify ssh_key_name"
}