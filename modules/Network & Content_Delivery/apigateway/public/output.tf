output "APIGW_Rest_API_ID" {
  description = "API Gateway ID."
  value = aws_api_gateway_rest_api.APIGW_Rest_API.id
}
output "APIGW_Rest_API_Execution_Arn" {
  description = "API Gateway Execution ARN."
  value = aws_api_gateway_rest_api.APIGW_Rest_API.execution_arn
}
output "APIGW_Log_Group_Name" {
  description = "API Gateway Execution ARN."
  value = aws_cloudwatch_log_group.CloudWatch_APIGW_Log_Group.name
}
