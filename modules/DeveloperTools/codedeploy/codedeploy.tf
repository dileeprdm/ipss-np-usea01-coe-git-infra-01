resource "aws_codedeploy_app" "codedeploy_app" {
  compute_platform = var.Codedeploy_App_Application_Compute_Platform
  name             = var.Codedeploy_App_Application_Name
}


resource "aws_codedeploy_deployment_group" "codedeploy_group" {
  app_name               = aws_codedeploy_app.codedeploy_app.name
  deployment_config_name = var.Codedeploy_Group_Deployment_Config_Name
  deployment_group_name  = var.Codedeploy_Group_Deployment_Group_Name
  service_role_arn       = var.Codedeploy_Group_Service_Role_ARN

  auto_rollback_configuration {
    enabled = var.Codedeploy_Group_Rollback_Enabled
    events  = [var.Codedeploy_Group_Rollback_Event]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = var.Codedeploy_Group_Action_Timeout
      wait_time_in_minutes = var.Codedeploy_Group_wait_time_in_minutes
    }
    terminate_blue_instances_on_deployment_success {
      action                           = var.Codedeploy_Group_terminate_blue_instances_on_deployment_success_action
      termination_wait_time_in_minutes = var.Codedeploy_Group_terminate_blue_instances_on_deployment_success_wait_time_in_minutes
    }
  }

  deployment_style {
    deployment_option = var.Codedeploy_Group_Deployment_Option
    deployment_type   = var.Codedeploy_Group_Deployment_Type
  }

  ecs_service {
    cluster_name = var.ECS_Cluster_Name
    service_name = var.ECS_Service_Name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [var.NLB_Listner_ARN]
      }

      target_group {
        name = var.NLB_Target_Group_Blue
      }

      target_group {
        name = var.NLB_Target_Group_Green
      }
    }
  }
  lifecycle {
    ignore_changes = [load_balancer_info]
  }
}