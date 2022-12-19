output "Lambda_Function_ARN" {
  value = aws_lambda_function.Lambda.arn
}
output "Lambda_Function_Name" {
  value = aws_lambda_function.Lambda.id
}

