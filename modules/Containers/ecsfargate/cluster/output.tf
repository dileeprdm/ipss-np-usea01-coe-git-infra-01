output "SG_ECSFargate_Service_ID" {
  description = "Security group ID for ECS Fargate Services."
  value = aws_security_group.SG_ECSFargate_Service.id
}
output "ECSFargate_Cluster_ID" {
  description = "ECS Fargate Cluster ID."
  value = aws_ecs_cluster.ECSFargate_Cluster.id
}
output "ECSFargate_Cluster_Name" {
  description = "ECS Fargate Cluster Name."
  value = aws_ecs_cluster.ECSFargate_Cluster.name
}
output "ECS_Cluster_ARN" {
  value = aws_ecs_cluster.ECSFargate_Cluster.arn
}