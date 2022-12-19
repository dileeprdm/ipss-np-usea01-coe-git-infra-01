output "KMS_Key_ARN" {
  description = "The arn of the General key"
  value = aws_kms_key.KMS_Key.arn
}