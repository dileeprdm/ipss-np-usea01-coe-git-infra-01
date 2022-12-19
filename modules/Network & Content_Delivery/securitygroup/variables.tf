variable "Securitygroup_Name" {
  description = "Provide the security group name"
}
variable "App_AcronymCode" {
  description = "Provide the Application Acronymcode"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "Securitygroup_vpc_Id" {
  description = "specify vpc id to attach with securitygroup"
}
variable "Securitygroup_vpc_CIDR" {
  description = "specify vpc CIDR to attach with securitygroup"
}
variable "Securitygroup_Port" {
  description = "specify security group port"
}