output "Launchtemplate_ID" {
  value = aws_launch_template.launch_template.id
}

output "ec2instance_autoscaling_Role_ARN" {
  value = aws_autoscaling_group.asg.arn
}
output "ec2instance_autoscaling_IAM_Role" {
  value = aws_iam_role.ec2-role.arn
}
output "ec2instance_autoscaling_SecurityGroup_ID" {
  value = aws_security_group.project-iac-sg.id
}