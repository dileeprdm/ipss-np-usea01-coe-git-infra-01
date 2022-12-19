
output "DB_CPU_ALARM_ARN" {
  description = "DB_CPU_ALARM_ARN"
  value = aws_cloudwatch_metric_alarm.CloudWatch_Alarm_RDS_Instance_CPU_High_P2.arn
}
output "DB_Memory_ALARM_ARN" {
  description = "DB_Memory_ALARM_ARN"
  value = aws_cloudwatch_metric_alarm.CloudWatch_Alarm_RDS_FreeableMemory_P2.arn
}
output "RDS_Max_Capacity_Alarm" {
  value = aws_cloudwatch_metric_alarm.CloudWatch_Alarm_RDS_Max_Capacity_P2.arn
  description = "RDS DB cluster name"
}


