output "ECSFargate_TASK_Deffinition_ARN" {
  description = "arn for ecs task definition"
  value = aws_ecs_task_definition.ECSFargate_Task_Definition.arn
}
output "ECSFargate_TASK_Deffinition_family" {
  description = "family for ecs task definition"
  value = aws_ecs_task_definition.ECSFargate_Task_Definition.family
}
output "Target_Group_1_Name" {
  value = aws_lb_target_group.NLB_ECSFargate_Target_Group_1.name
}

output "Target_Group_1_ID" {
  value = aws_lb_target_group.NLB_ECSFargate_Target_Group_1.id
}
output "Target_Group_2_Name" {
  value = aws_lb_target_group.NLB_ECSFargate_Target_Group_2.name
}

output "Target_Group_2_ID" {
  value = aws_lb_target_group.NLB_ECSFargate_Target_Group_2.id
}
output "ECS_Service_Name" {
  value = aws_ecs_service.ECSFargate_Service.name
}