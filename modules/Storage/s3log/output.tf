output "S3_Log_Bucket_ID" {
   value = aws_s3_bucket.S3_Log_Bucket.id
}

output "S3_Log_Bucket_ARN" {
   value = aws_s3_bucket.S3_Log_Bucket.arn
}
output "S3_Log_Bucket_Domain_ARN" {
   value = aws_s3_bucket.S3_Log_Bucket.bucket_domain_name
}