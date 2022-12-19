data "aws_subnet" "Subnet_AZ1" {
  id = var.Subnet_ID_AZ1
}
data "aws_subnet" "Subnet_AZ2" {
  id = var.Subnet_ID_AZ2
}
resource "aws_lb_target_group" "NLB_ECSFargate_Target_Group_1" {
  name = var.Target_Group_Name_1
  port = var.ECSFargate_Container_Port
  protocol = var.NLB_ECSFargate_Target_Group_Protocol
  deregistration_delay = var.NLB_ECSFargate_Target_Group_Deregistration_Delay
  target_type = var.NLB_ECSFargate_Target_Group_Target_Type
  vpc_id = var.VPC_ID
  health_check {
    healthy_threshold = var.NLB_ECSFargate_Target_Group_Healthy_Threshold
    unhealthy_threshold = var.NLB_ECSFargate_Target_Group_Healthy_Threshold
    protocol = var.NLB_ECSFargate_Target_Group_Health_Protocol
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Target_Group_Name_1}))
}
resource "aws_lb_target_group" "NLB_ECSFargate_Target_Group_2" {
  name = var.Target_Group_Name_2
  port = var.ECSFargate_Container_Port
  protocol = var.NLB_ECSFargate_Target_Group_Protocol
  deregistration_delay = var.NLB_ECSFargate_Target_Group_Deregistration_Delay
  target_type = var.NLB_ECSFargate_Target_Group_Target_Type
  vpc_id = var.VPC_ID
  health_check {
    healthy_threshold = var.NLB_ECSFargate_Target_Group_Healthy_Threshold
    unhealthy_threshold = var.NLB_ECSFargate_Target_Group_Healthy_Threshold
    protocol = var.NLB_ECSFargate_Target_Group_Health_Protocol
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Target_Group_Name_2}))
}

resource "aws_lb_listener" "NLB_ECSFargate_Listener" {
  load_balancer_arn = var.NLB_ID
  port = var.ECSFargate_Container_Port
  protocol = var.NLB_ECSFargate_Listener_Protocol
  default_action {
    target_group_arn = aws_lb_target_group.NLB_ECSFargate_Target_Group_1.id
    type = var.NLB_ECSFargate_Listener_Default_Action_Type
  }
  lifecycle {
    ignore_changes = [default_action]
  }
}

resource "aws_cloudwatch_log_group" "CloudWatch_ECSFargate_Log_Group" {
  name = var.CloudWatch_ECSFargate_Log_Group_Name
  retention_in_days = var.CloudWatch_Log_Group_Retention
  tags = merge(var.Default_Tags, tomap({Name=var.CloudWatch_ECSFargate_Log_Group_Name}))
}
resource "aws_ecs_task_definition" "ECSFargate_Task_Definition" {
  depends_on = [aws_cloudwatch_log_group.CloudWatch_ECSFargate_Log_Group]
  family = var.ECSFargate_Task_Definition_Family_Name
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = var.ECSFargate_Task_Definition_CPU
  memory = var.ECSFargate_Task_Definition_Memory
  execution_role_arn = var.IAM_ECSFargate_Task_Role_ARN
  task_role_arn = var.IAM_ECSFargate_Task_Role_ARN
  container_definitions = <<DEFINITION
  [
    {
      "name" : "ctr-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_Service}-01",
      "image" : "${var.ECR_Repository_URL}",
      "cpu" : ${var.ECSFargate_Task_Definition_CPU},
      "memory" : ${var.ECSFargate_Task_Definition_Memory},
      "environment": [
            {"name": "NODE_ENV", "value": "${var.ECSFargate_Task_Definition_NODE_ENV}"}
        ],
      "portMappings": [
        {
          "protocol" : "tcp",
          "containerPort" : ${var.ECSFargate_Container_Port},
          "hostPort" : ${var.ECSFargate_Container_Port}
        }
      ],
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : "cwlg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_Service}-01",
          "awslogs-region" : "${var.AWS_Region}",
          "awslogs-stream-prefix" : "ecs"
        }
      }
    }
  ]
DEFINITION
  tags = merge(var.Default_Tags, tomap({Name=var.ECSFargate_Task_Definition_Family_Name}))
}
resource "aws_ecs_service" "ECSFargate_Service" {
  depends_on = [aws_lb_listener.NLB_ECSFargate_Listener,]
  name = var.ECSFargate_Service_Name
  cluster = var.ECSFargate_Cluster_ID
  task_definition = aws_ecs_task_definition.ECSFargate_Task_Definition.arn
  desired_count = var.ECSFargate_Task_Desired_Count
  launch_type = var.ECSFargate_Launch_Type
  deployment_maximum_percent = var.ECSFargate_Deployment_Max_Percent
  deployment_minimum_healthy_percent = var.ECSFargate_Deployment_Min_Healthy_Percent
  health_check_grace_period_seconds  = var.ECSFargate_Health_Check_Grace_Period
  network_configuration {
    security_groups = [var.SG_ECSFargate_Service_ID]
    subnets = [var.Subnet_ID_AZ1,var.Subnet_ID_AZ2]
    assign_public_ip = var.ECSFargate_Assign_Public_IP
  }
  deployment_controller {
    type = var.ECSFargate_Deployment_Controller_Type
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.NLB_ECSFargate_Target_Group_1.id
    container_name = "ctr-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_Service}-01"
    container_port = var.ECSFargate_Container_Port
  }
  tags = merge(var.Default_Tags, tomap({Name=var.ECSFargate_Service_Name}))
  propagate_tags = var.ECSFargate_Propagate_Tags
}
resource "aws_appautoscaling_target" "ECSFargate_Service_Autoscale_Target" {
  service_namespace = "ecs"
  resource_id = "service/${var.ECSFargate_Cluster_Name}/${aws_ecs_service.ECSFargate_Service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity = var.ECSFargate_Servic_Min_Capacity
  max_capacity = var.ECSFargate_Servic_Max_Capacity
  role_arn = var.IAM_ECSFargate_Autoscale_Role_ARN
}
resource "aws_appautoscaling_policy" "ECSFargate_Service_Autoscale_Target_Policy_CPU" {
  name = "asp-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-cpu-01"
  policy_type = "TargetTrackingScaling"
  service_namespace = aws_appautoscaling_target.ECSFargate_Service_Autoscale_Target.service_namespace
  scalable_dimension = aws_appautoscaling_target.ECSFargate_Service_Autoscale_Target.scalable_dimension
  resource_id = aws_appautoscaling_target.ECSFargate_Service_Autoscale_Target.resource_id
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = 80
    scale_in_cooldown = "60"
    scale_out_cooldown = "60"
  }
}
resource "aws_appautoscaling_policy" "ECSFargate_Service_Autoscale_Target_Policy_Memory" {
  name = "asp-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-mem-01"
  policy_type = "TargetTrackingScaling"
  service_namespace = aws_appautoscaling_target.ECSFargate_Service_Autoscale_Target.service_namespace
  scalable_dimension = aws_appautoscaling_target.ECSFargate_Service_Autoscale_Target.scalable_dimension
  resource_id = aws_appautoscaling_target.ECSFargate_Service_Autoscale_Target.resource_id
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value = 80
    scale_in_cooldown = "60"
    scale_out_cooldown = "60"
  }
}
