variable "App_EnvironmentType" {
  description = "Provide the environment in which the resources will be hosted"
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
variable "AWS_Account_Number" {
  description = "Provide the AWS account number in which resources will be hosted"
}
variable "APIGW_Endpoint_Type" {
  description = "Specify API Gateway Endpoint Type."
}
variable "web_acl_arn" {}
variable "APIGW_Rest_API_Swagger_Template" {
  description = "Provide API Gateway Swagger File Path"
}
variable "APIGW_Rest_API_Host" {
  description = "Provide API Gateway Host Name"
}
variable "APIGW_Rest_API_Name" {
  description = "Provide API Gateway Name."
}
variable "APIGW_Loggroup_Retention" {
  description = "Provide APIGW_Loggroup_Retention."
}
variable "APIGW_Binary_Media_Type" {
  description = "Specify API Gateway Binary Media Type."
}
variable "Lambda_Permission_Statement_ID" {
  description = "Specify Lambda Permission Statement ID"
}
variable "Lambda_Permission_Action" {
  description = "Specify Lambda Permission Action"
}
variable "Lambda_Permission_Principal" {
  description = "Specify Lambda Permission Principal"
}
variable "Lambda_Permission_Function_Name" {
  description = "Specify Lambda Permission Function Name "
}
/*variable "API_Gateway_NLB_ARN" {
  description = "Specify NLB ARN to attach it to VPClink "
}*/
variable "APIGW_Stage_Throttling_Burst_Limit" {
  description = "Specify API Stage Throttling Burst limit."
}
variable "APIGW_Stage_Throttling_Rate_Limit" {
  description = "Specify API Stage Throttling Rate limit."
}
variable "APIGW_APIkey_App_Service01_Name" {
  description = "Provide API Key Name."
}
variable "APIGW_APIkey_UsagePlan_App_Service01_Name" {
  description = "Provide API Key Usage Plan Name."
}
variable "APIGW_APIkey_App_Service01_UsagePlan_Quota_Limit" {
  description = "Specify API key usage plan quota limit."
}
variable "APIGW_APIkey_App_Service01_UsagePlan_Quota_Period" {
  description = "Specify API key usage plan quota period."
}
variable "APIGW_APIkey_App_Service01_UsagePlan_Burst_Limit" {
  description = "Specify API key usage plan burst limit."
}
variable "APIGW_APIkey_App_Service01_UsagePlan_Rate_Limit" {
  description = "Specify API key usage plan rate limit."
}
variable "APIGW_Domain_Name" {
  description = "Specify API Domain Name to be associated."
}
variable "APIGW_Domain_Name_BasePath" {
  description = "Specify API Domain Name base path to be associated."
}
variable "Lambda_Function_Name" {
  description = "Provide Lambda Function Name"
}
variable "CloudWatch_Alarm_APIGW_5XX_P3_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW 5XX."
}
variable "CloudWatch_Alarm_APIGW_4XX_P3_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW 4XX."
}
variable "CloudWatch_Alarm_APIGW_latency_P3_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW Latency."
}
variable "CloudWatch_Log_Metric_Filter_APIKey_Quota_Name" {
  description = "Specify CloudWatch Log Metric Filter APIKey Quota Name."
}
variable "CloudWatch_Alarm_APIKey_Quota_Metric_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW APIKey Quota Metric."
}
variable "CloudWatch_Alarm_APIKey_Quota_P3_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW APIKey Quota."
}
variable "SNS_Alarm_ARN" {
  description = "Provide SNS alarm topic ARN"
}
variable "CloudWatch_Alarm_APIGW_5XX_P2_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW 5XX Error."
}
variable "CloudWatch_Alarm_APIGW_5XX_P1_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW 5XX Error."
}
variable "CloudWatch_Alarm_APIGW_4XX_P2_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW 4XX Error."
}
variable "CloudWatch_Alarm_APIGW_latency_P2_Name" {
  description = "Specify CloudWatch Alarm Name for APIGW Latency."
}