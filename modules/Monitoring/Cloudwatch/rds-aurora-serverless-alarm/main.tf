resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_RDS_Instance_CPU_High_P2" {
  alarm_name          = var.RDS_CPU_Alarm_Name
  alarm_description   = "${var.ApplicationName} - RDS Instance CPU utilization is High. Create a P2 incident and assign to BLD_HR&SO in SNOW."
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  alarm_actions       = [var.SNS_Alarm_ARN]
  dimensions          = {
    DBClusterIdentifier = var.RDS_Cluster.id
  }
  tags                = merge(var.Default_Tags, tomap({ Name = var.RDS_CPU_Alarm_Name }))
}

variable "RDS_Max_Capacity_Alarm_Name" {
  default = ""
}
variable "RDS_Max_Capacity" {
  default = ""
}
resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_RDS_Max_Capacity_P2" {
    alarm_name = var.RDS_Max_Capacity_Alarm_Name
    alarm_description = "RDS Serverless Database Capacity is running with Max capacity set. Create a P2 incident and assign to BLD_HR&SO in SNOW."
    metric_name = "ServerlessDatabaseCapacity"
    namespace = "AWS/RDS"
    period = "300"
    statistic = "Maximum"
    threshold = var.RDS_Max_Capacity
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "1"
    alarm_actions = [var.SNS_Alarm_ARN]
    dimensions = {
      DBClusterIdentifier = var.RDS_Cluster.id
    }
}



resource "aws_cloudwatch_metric_alarm" "CloudWatch_Alarm_RDS_FreeableMemory_P2" {
  alarm_name = var.RDS_Freeable_Memory_Alarm_Name
  alarm_description = "${var.ApplicationName} - RDS Serverless Database Capacity freeable memory is Low. Create a P2 incident and assign to BLD_HR&SO in SNOW."
  metric_name = "FreeableMemory"
  namespace = "AWS/RDS"
  period = "300"
  statistic = "Average"
  threshold = "300000000"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "1"
  alarm_actions = [var.SNS_Alarm_ARN]
  dimensions = {
    DBClusterIdentifier = var.RDS_Cluster.id
  }
  tags = merge(var.Default_Tags, tomap({Name=var.RDS_Freeable_Memory_Alarm_Name}))
}