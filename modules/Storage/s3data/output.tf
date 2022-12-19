###########################Output of S3 data bucket #################
output "S3_Data_Bucket_ID" {
   value = aws_s3_bucket.S3_Data_Bucket.id
}

output "S3_Data_Bucket_ARN" {
   value = aws_s3_bucket.S3_Data_Bucket.arn
}