variable "App_EnvironmentType" {
  description = "Provide the profile name where credentails are stored"
}
variable "AWS_Region_Code" {
  description = "Provide the AWS Region code in which resources will be hosted"
}
variable "App_AcronymCode" {
  description = "Provide the Application Acronymcode"
}
variable "App_ClusterCode" {
  description = "Provide the Application ClusterCode"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "AWS_Region" {
  description = "Provide the AWS Region in which resources will be hosted"
}
variable "Subnet_ID_AZ1" {
  description = "Provide eu-west-1a(AZ1) Availability Zone trusted subnet ID"
}
variable "Subnet_ID_AZ2" {
  description = "Provide eu-west-1b(AZ2) Availability Zone trusted subnet ID"
}

variable "VPC_ID" {
  description = "Provide VPC ID in which resouces will be hosted"
}
variable "App_Service" {
  description = "Provide Application service name for the resource"
}
variable "ECSFargate_Container_Port" {
  description = "specify the port on the ECS Fargate container to associate with the load balancer."
}
variable "NLB_ECSFargate_Target_Group_Protocol" {
  description = "Specify protocol to use for routing traffic to the NLB targets."
}
variable "NLB_ECSFargate_Target_Group_Deregistration_Delay" {
  description = "Specify amount time for Load Balancing to wait before changing the state of a deregistering target from draining to unused."
}
variable "NLB_ECSFargate_Target_Group_Target_Type" {
  description = "Specify type of target that must be specified when registering targets with this target group."
}
variable "NLB_ECSFargate_Target_Group_Healthy_Threshold" {
  description = "Specify number of consecutive health checks successes required before considering an unhealthy target healthy."
}
variable "NLB_ID" {
  description = "Specify NLB ID"
}
variable "NLB_ECSFargate_Listener_Protocol" {
  description = "Specify protocol for connections from clients to the load balancer."
}
variable "NLB_ECSFargate_Listener_Default_Action_Type" {
  description = "Specify default type of routing action for load balancer."
}
variable "CloudWatch_Log_Group_Retention" {
  description = "Specify CloudWatch Logs retention period."
}
variable "IAM_ECSFargate_Task_Role_ARN" {
  description = "Specify ECS Fargate IAM task Role ARN."
}
variable "ECR_Repository_URL" {
  description = "Provide ECR Image Repository URL"
}
variable "ECSFargate_Task_Definition_CPU" {
  description = "Specify the number of cpu units used by the ECS Fargate task."
}
variable "ECSFargate_Task_Definition_Memory" {
  description = "Specify the amount (in MiB) of memory used by the ECS Fargate task."
}
variable "ECSFargate_Cluster_ID" {
  description = "Provide ECS Fargate Cluster ID"
}
variable "ECSFargate_Task_Desired_Count" {
  description = "Specify the number of instances of the task definition to place and keep running"
}
variable "ECSFargate_Deployment_Max_Percent" {
  description = "Specify the upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
}
variable "ECSFargate_Deployment_Min_Healthy_Percent" {
  description = "Specify the lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
}
variable "ECSFargate_Health_Check_Grace_Period" {
  description = "Specify seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers."
}
variable "SG_ECSFargate_Service_ID" {
  description = "Specify the Security group ID to attache to ECS Fargate service"
}
variable "ECSFargate_Assign_Public_IP" {
  description = "Specify if public IP needs to be assigned to ECS Fargate Service"
}
variable "ECSFargate_Cluster_Name" {
  description = "Provide ECS Fargate Cluster Name"
}
variable "ECSFargate_Servic_Min_Capacity" {
  description = "Specify Minimum number of running instances of a ECS faraget Service"
}
variable "ECSFargate_Servic_Max_Capacity" {
  description = "Specify Maximum number of running instances of a ECS faraget Service"
}
variable "IAM_ECSFargate_Autoscale_Role_ARN" {
  description = "Specify ECS Fargate IAM Autoscale Role ARN."
}
variable "NLB_ARNsuffix" {
  description = "Provide NLB ARN Suffix"
}
variable "Target_Group_Name_1" {
  description = "Target Group Name"
}
variable "Target_Group_Name_2" {
  description = "Target Group Name"
}
variable "NLB_ECSFargate_Target_Group_Health_Protocol" {
  description = "Specify protocol for connections from clients to the load balancer."
}
variable "CloudWatch_ECSFargate_Log_Group_Name" {
  description = "CloudWatch_ECSFargate_Log_Group_Name"
}
variable "ECSFargate_Task_Definition_Family_Name" {
  description = "ECSFargate_Task_Definition_Family_Name"
}
variable "ECSFargate_Service_Name" {
  description = "Name of the ECS Fargate Service"
}
variable "ECSFargate_Launch_Type" {
  description = "ECS Fargate Launch Type"
}
variable "ECSFargate_Propagate_Tags" {
  description = "ECS Fargatee tags Propagation option"
}
variable "ECSFargate_Task_Definition_NODE_ENV" {
  description = "Environment Variable Value"
}

variable "ECSFargate_Deployment_Controller_Type" {
  description = "Deployment Controller Type"
}
