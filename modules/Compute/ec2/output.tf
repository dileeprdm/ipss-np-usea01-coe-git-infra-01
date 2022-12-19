output "ec2instance_IP" {
  value = aws_instance.project-iac.private_ip
}
output "ec2instance_IAM_Role" {
  value = aws_iam_role.ec2-role.arn
}
output "ec2instance_SecurityGroup_ID" {
  value = aws_security_group.project-iac-sg.id
}
