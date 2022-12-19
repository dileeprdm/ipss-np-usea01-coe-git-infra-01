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

variable "VPC_ID" {
  description = "Provide VPC ID in which resouces will be hosted"
}
variable "EC2_User_Data_Path" {
  default = ""
}

/*variable "KMS_Key_EC2" {
  description = "Specify KMS_Key_EC2"
}*/
variable "instance-profile_name" {
  description = "Specify instance-profile."
}
variable "instance-role_name" {
  description = "Specify instance-role"
}

variable "Subnet_ID_AZ1_Private" {
  description = "Provide eu-west-1a(AZ1) Availability Zone Subnet_ID_AZ1_Private subnet ID"
}
variable "Subnet_ID_AZ2_Private" {
  description = "Provide eu-west-1b(AZ2) Availability Zone Subnet_ID_AZ2_Private subnet ID"
}

###############################ASG############################################################


variable "instance_type" {
  description = "Specify the Volume_Name."
}
variable "LaunchTemplate_Name" {
  description = "specify the Instance_Name."
}

variable "autoscaling_group_name" {
  description = "Specify security_group_id"
}
variable "max_ec2_instance_count" {
  description = "Specify security_group_id"
}
variable "min_ec2_instance_count" {
  description = "Specify security_group_id"
}

variable "ssh_key_name" {
  description = "Specify ssh_key_name"
}
#########################IAM############################################

variable "ApplicationAcronym" {
  default = ""
}
variable "DevOpsTeam" {
  default = ""
}
variable "Truck" {
  default = ""
}
variable "ApplicationName" {
  default = ""
}

