data "template_file" "APIGW_Rest_API_Swagger" {
  template = file(var.APIGW_Rest_API_Swagger_Template)
  vars={
    title = var.APIGW_Rest_API_Name
    description = "API Gateway for ${var.App_AcronymCode} Application"
    host = var.APIGW_Rest_API_Host
    basePath = var.APIGW_Domain_Name_BasePath
    AWS_Region = var.AWS_Region
    AWS_Account_Number = var.AWS_Account_Number
    vpcEndpointIds = var.APIGW_VPC_Endpoint_ID
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
    vpc_endpoint_ids = [var.APIGW_VPC_Endpoint_ID]
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
            "Condition" : {
                "StringNotEquals": {
                    "aws:SourceVpce": "${var.APIGW_VPC_Endpoint_ID}"
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

