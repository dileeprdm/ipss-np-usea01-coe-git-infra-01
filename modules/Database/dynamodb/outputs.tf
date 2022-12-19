output "Dynamo_DB_Table_Name" {
  description = "Dynamo DB Table Name"
  value = aws_dynamodb_table.DynamoDB-Table.id
}
output "Dynamo_DB_Table_ARN" {
  description = "Dynamo DB Table ARN"
  value = aws_dynamodb_table.DynamoDB-Table.arn
}