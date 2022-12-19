output "Secret_Manager_ID" {
   description = "Secrets Manager ARN storing the details for application."
   value = aws_secretsmanager_secret.Secret_Manager.id
}

output "Secret_Manager_ARN" {
   description = "Secrets Manager ARN storing the details for application."
   value = aws_secretsmanager_secret.Secret_Manager.arn
}