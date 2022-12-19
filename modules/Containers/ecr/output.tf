output "ECR_ARN" {
  value = aws_ecr_repository.ECR.arn
}
output "ECR_Name" {
  value = aws_ecr_repository.ECR.name
}
output "ECR_Repository_URL" {
  value = aws_ecr_repository.ECR.repository_url
}