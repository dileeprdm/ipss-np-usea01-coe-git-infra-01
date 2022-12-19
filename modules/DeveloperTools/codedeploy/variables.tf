variable "Codedeploy_App_Application_Compute_Platform" {
  description = "Codedeploy_App_Application_Compute_Platform"
}
variable "Codedeploy_App_Application_Name" {
  description = "Codedeploy_App_Application_Name"
}
variable "Codedeploy_Group_Deployment_Config_Name" {
  description = "Codedeploy_Group_Deployment_Config_Name"
}
variable "Codedeploy_Group_Deployment_Group_Name" {
  description = "Codedeploy_Group_Deployment_Group_Name"
}
variable "Codedeploy_Group_Service_Role_ARN" {
  description = "Codedeploy_Group_Service_Role_ARN"
}
variable "Codedeploy_Group_Rollback_Enabled" {
  description = "Codedeploy_Group_Rollback_Enabled"
}
variable "Codedeploy_Group_Rollback_Event" {
  description = "Codedeploy_Group_Rollback_Event"
}
variable "Codedeploy_Group_Action_Timeout" {
  description = "Codedeploy_Group_Action_Timeout"
}
variable "Codedeploy_Group_wait_time_in_minutes" {
  description = "Codedeploy_Group_Action_Timeout"
}
variable "Codedeploy_Group_Deployment_Option" {
  description = "Codedeploy_Group_Deployment_Option"
}
variable "Codedeploy_Group_Deployment_Type" {
  description = "Codedeploy_Group_Deployment_Type"
}
variable "ECS_Cluster_Name" {
  description = "ECS_Cluster_Name"
}
variable "ECS_Service_Name" {
  description = "ECS_Service_Name"
}
variable "NLB_Listner_ARN" {
  description = "NLB_Listner_ARN"
}
variable "NLB_Target_Group_Blue" {
  description = "NLB_Target_Group_Blue"
}
variable "NLB_Target_Group_Green" {
  description = "NLB_Target_Group_Green"
}
variable "Codedeploy_Group_terminate_blue_instances_on_deployment_success_action" {
  description = "Blue Instance Termination Action"
}
variable "Codedeploy_Group_terminate_blue_instances_on_deployment_success_wait_time_in_minutes" {
  default = "Blue Instance termination wait in minutes"
}
