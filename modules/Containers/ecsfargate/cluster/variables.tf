variable "App_AcronymCode" {
  description = "Provide the Application Acronymcode"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "Subnet_ID_AZ1" {
  description = "Provide AZ1 Availability Zone trusted subnet ID"
}
variable "Subnet_ID_AZ2" {
  description = "Provide AZ2 Availability Zone trusted subnet ID"
}
variable "VPC_ID" {
  description = "Provide VPC ID in which resouces will be hosted"
}
variable "ECSFargate_Port_AppService01" {
  description = "Specify the port on the container service to associate with the load balancer."
}
variable "ECSFargate_Port_AppService02" {
  description = "Specify the port on the container service to associate with the load balancer."
}
variable "ECSFargate_Service_SG_Name" {
  description = "Security Grouup Name for ECS Fargate Service"
}
variable "ECSFargate_Cluster_Name" {
  description = "ECS Fargate Cluster Name"
}
variable "ECSFargate_ContainerInsights" {
  description = "Enable or Disable Container Insights"
}