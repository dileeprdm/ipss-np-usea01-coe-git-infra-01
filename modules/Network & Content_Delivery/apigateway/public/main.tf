data "template_file" "APIGW_Rest_API_Swagger" {
  template = file(var.APIGW_Rest_API_Swagger_Template)
  vars={
    title = var.APIGW_Rest_API_Name
    description = "API Gateway for ${var.App_AcronymCode} Application"
    host = var.APIGW_Rest_API_Host
    basePath = var.APIGW_Domain_Name_BasePath
    AWS_Region = var.AWS_Region
    AWS_Account_Number = var.AWS_Account_Number
    Lambda_Function_Name = var.Lambda_Function_Name
    binary_media_types = var.APIGW_Binary_Media_Type
  }
}

resource "aws_api_gateway_rest_api" "APIGW_Rest_API" {
  name = var.APIGW_Rest_API_Name
  description = "API Gateway for ${var.App_AcronymCode} Application"
  body = data.template_file.APIGW_Rest_API_Swagger.rendered
  endpoint_configuration {
    types = [var.APIGW_Endpoint_Type]
  }
  binary_media_types = [var.APIGW_Binary_Media_Type]
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "execute-api:Invoke",
            "Resource": "arn:aws:execute-api:${var.AWS_Region}:${var.AWS_Account_Number}:*"
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "execute-api:Invoke",
            "Resource": "arn:aws:execute-api:${var.AWS_Region}:${var.AWS_Account_Number}:*",
            "Condition": {
                "NotIpAddress": {
                    "aws:SourceIp": [
                        ""
                    ]
                }
            }
        }
    ]
}
EOF
  tags = merge(var.Default_Tags, tomap({Name=var.APIGW_Rest_API_Name}))
}

resource "aws_cloudwatch_log_group" "CloudWatch_APIGW_Log_Group" {
  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.APIGW_Rest_API.id}/${var.App_EnvironmentType}"
  retention_in_days = var.APIGW_Loggroup_Retention
  tags = merge(var.Default_Tags, tomap({Name="/aws/apigateway/apg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.App_AcronymCode}-01"}))
}


resource "aws_wafv2_web_acl_association" "WAF_Web_ACL_Association" {
  resource_arn = "arn:aws:apigateway:${var.AWS_Region}::/restapis/${aws_api_gateway_rest_api.APIGW_Rest_API.id}/stages/${var.App_EnvironmentType}"
  web_acl_arn = var.web_acl_arn
}

resource "aws_lambda_permission" "Lambda_Function_Permission" {
  count = length(var.Lambda_Permission_Function_Name)
  statement_id = var.Lambda_Permission_Statement_ID
  action = var.Lambda_Permission_Action
  function_name = var.Lambda_Permission_Function_Name[count.index]
  principal = var.Lambda_Permission_Principal
  source_arn = "${aws_api_gateway_rest_api.APIGW_Rest_API.execution_arn}/*/*"
}



resource "aws_api_gateway_method_settings" "APIGW_Stage_Settings" {
  depends_on = [aws_api_gateway_deployment.APIGW_Deployment]
  rest_api_id = aws_api_gateway_rest_api.APIGW_Rest_API.id
  stage_name = var.App_EnvironmentType
  method_path = "*/*"
  settings {
    metrics_enabled = true
    logging_level = "INFO"
    data_trace_enabled = true
    throttling_burst_limit = var.APIGW_Stage_Throttling_Burst_Limit
    throttling_rate_limit = var.APIGW_Stage_Throttling_Rate_Limit
  }
}

resource "aws_api_gateway_deployment" "APIGW_Deployment" {
depends_on = [aws_api_gateway_rest_api.APIGW_Rest_API]
rest_api_id = aws_api_gateway_rest_api.APIGW_Rest_API.id
stage_name = var.App_EnvironmentType
stage_description = "Deployed at ${timestamp()}"
lifecycle {
  create_before_destroy = true
}
}

resource "aws_api_gateway_api_key" "APIGW_APIkey_App_Service01" {
  name = var.APIGW_APIkey_App_Service01_Name
  description = "${var.App_AcronymCode} API Key for application"
  enabled = true
  tags = merge(var.Default_Tags, tomap({Name=var.APIGW_APIkey_App_Service01_Name}))
}

resource "aws_api_gateway_usage_plan" "APIGW_APIkey_UsagePlan_App_Service01" {
  name = var.APIGW_APIkey_UsagePlan_App_Service01_Name
  description = "${var.App_AcronymCode} Usage plan for the application API key"
  quota_settings {
    limit = var.APIGW_APIkey_App_Service01_UsagePlan_Quota_Limit
    period = var.APIGW_APIkey_App_Service01_UsagePlan_Quota_Period
  }
  throttle_settings {
    burst_limit = var.APIGW_APIkey_App_Service01_UsagePlan_Burst_Limit
    rate_limit = var.APIGW_APIkey_App_Service01_UsagePlan_Rate_Limit
  }
  api_stages {
    api_id = aws_api_gateway_rest_api.APIGW_Rest_API.id
    stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  tags = merge(var.Default_Tags, tomap({Name=var.APIGW_APIkey_UsagePlan_App_Service01_Name}))
}

resource "aws_api_gateway_usage_plan_key" "APIGW_APIkey_UsagePlanKey_App_Service01" {
  key_id = aws_api_gateway_api_key.APIGW_APIkey_App_Service01.id
  key_type = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.APIGW_APIkey_UsagePlan_App_Service01.id
}

resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_5XX_P3" {
  alarm_name = var.CloudWatch_Alarm_APIGW_5XX_P3_Name
  alarm_description = "API 5XX Errors are generated. Create a P3 incident and assign to hrso Team in SNOW."
  metric_name = "5XXError"
  namespace = "AWS/ApiGateway"
  period  = "300"
  statistic = "Sum"
  threshold = "5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIGW_5XX_P3_Name}))
}
resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_5XX_P2" {
  
  alarm_name = var.CloudWatch_Alarm_APIGW_5XX_P2_Name
  alarm_description = "API 5XX Errors are generated. Create a P2 incident and assign to hrso Team in SNOW."
  metric_name = "5XXError"
  namespace = "AWS/ApiGateway"
  period  = "300"
  statistic = "Sum"
  threshold = "25"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIGW_5XX_P2_Name}))
}

resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_5XX_P1" {
  
  alarm_name = var.CloudWatch_Alarm_APIGW_5XX_P1_Name
  alarm_description = "API 5XX Errors are generated. Create a P1 incident and assign to hrso Team in SNOW."
  metric_name = "5XXError"
  namespace = "AWS/ApiGateway"
  period  = "300"
  statistic = "Sum"
  threshold = "50"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIGW_5XX_P1_Name}))
}

resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_4XX_P3" {
  alarm_name = var.CloudWatch_Alarm_APIGW_4XX_P3_Name
  alarm_description = "API 4XX Errors are generated. Create a P3 incident and assign to hrso Team in SNOW."
  metric_name = "4XXError"
  namespace = "AWS/ApiGateway"
  period = "300"
  statistic = "Sum"
  threshold = "25"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags,tomap({Name=var.CloudWatch_Alarm_APIGW_4XX_P3_Name}))
}
resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_4XX_P2" {
  alarm_name = var.CloudWatch_Alarm_APIGW_4XX_P2_Name
  alarm_description = "API 4XX Errors are generated. Create a P2 incident and assign to hrso Team in SNOW."
  metric_name = "4XXError"
  namespace = "AWS/ApiGateway"
  period = "300"
  statistic = "Sum"
  threshold = "50"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIGW_4XX_P2_Name}))
}

resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_latency_P3" {
  alarm_name = var.CloudWatch_Alarm_APIGW_latency_P3_Name
  alarm_description = "API Gateway Latency is High. Create a P3 incident and assign to hrso Team in SNOW."
  metric_name = "Latency"
  namespace = "AWS/ApiGateway"
  period = "300"
  statistic = "Average"
  threshold = "5000"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIGW_latency_P3_Name}))
}
resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIGW_latency_P2" {
  
  alarm_name = var.CloudWatch_Alarm_APIGW_latency_P2_Name
  alarm_description = "API Gateway Latency is High. Create a P2 incident and assign to hrso Team in SNOW."
  metric_name = "Latency"
  namespace = "AWS/ApiGateway"
  period = "300"
  statistic = "Average"
  threshold = "29000"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    ApiName = var.APIGW_Rest_API_Name
    Stage = aws_api_gateway_deployment.APIGW_Deployment.stage_name
  }
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIGW_latency_P2_Name}))
}

resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_APIKey_Quota" {
  alarm_name = var.CloudWatch_Alarm_APIKey_Quota_P3_Name
  alarm_description = "API Key Quota has been exhausted. Create a P3 incident and assign to hrso Team in SNOW."
  metric_name = var.CloudWatch_Alarm_APIKey_Quota_Metric_Name
  namespace = "ApiKeyQuotaExhausted"
  period = "300"
  statistic = "Sum"
  threshold = "1"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  treat_missing_data = "notBreaching"
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_Alarm_APIKey_Quota_P3_Name}))
}