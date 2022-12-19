resource "aws_s3_bucket" "S3_Data_Bucket" {
  bucket = var.S3_Data_Bucket_name
  acl = "private"
  tags = merge(var.Default_Tags, tomap({Name=var.S3_Data_Bucket_name }))
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.S3_KMS_Key_Secret
        sse_algorithm     = "aws:kms"
      }
    }
  }
   versioning {
    enabled = var.S3_Enable_Versioning
  }
  logging {
    target_bucket = var.S3_LogBucket_Id
    target_prefix = "${var.S3_Prefix}/"
  }
 }

resource "aws_s3_bucket_policy" "S3_Data_BucketPolicy" {
  bucket = aws_s3_bucket.S3_Data_Bucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "s3dataBucketPolicy",
    "Statement": [
        {
            "Sid": "ForceSSLOnlyAccess",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.S3_Data_Bucket.id}",
				"arn:aws:s3:::${aws_s3_bucket.S3_Data_Bucket.id}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:DeleteBucket",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.S3_Data_Bucket.id}"
        }
    ]
}
POLICY
}
