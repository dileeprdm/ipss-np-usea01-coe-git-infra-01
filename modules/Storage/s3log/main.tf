resource "aws_s3_bucket" "S3_Log_Bucket" {
  bucket = var.s3_Log_Bucket_name
  acl = "log-delivery-write"
  tags = merge(var.Default_Tags, tomap({Name=var.s3_Log_Bucket_name}))
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.S3_SSE_Algorithm
      }
    }
  }
    lifecycle_rule {
    id = "Delete_Expired_Objects"
    enabled = var.S3_Lifecycle_Rule_Status
    expiration {
      days = var.S3_Lifecycle_Rule_Expiration_Days
    }
  }
}

resource "aws_s3_bucket_policy" "S3_Log_BucketPolicy" {
  bucket = aws_s3_bucket.S3_Log_Bucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "s3logBucketPolicy",
    "Statement": [
      {
        "Sid": "ForceSSLOnlyAccess",
        "Effect": "Deny",
        "Principal": "*",
        "Action": "s3:*",
        "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.S3_Log_Bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.S3_Log_Bucket.id}/*"
        ],
        "Condition": {
          "Bool": {"aws:SecureTransport": "false"}
        }
      },
      {
        "Effect": "Allow",
        "Principal": {
            "AWS": [
                    "arn:aws:iam::${var.AWS_Account_Number}:root",
                    "arn:aws:iam::156460612806:root"
                ]
        },
        "Action": "s3:PutObject",
        "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.S3_Log_Bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.S3_Log_Bucket.id}/*"
        ]
      },
      {
        "Effect": "Allow",
        "Principal": {
            "Service": "delivery.logs.amazonaws.com"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.S3_Log_Bucket.id}/*",
        "Condition": {
            "StringEquals": {
              "s3:x-amz-acl": "bucket-owner-full-control"
            }
          }
      },
      {
        "Effect": "Allow",
        "Principal": {
            "Service": "delivery.logs.amazonaws.com"
        },
        "Action": "s3:GetBucketAcl",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.S3_Log_Bucket.id}"
      }
    ]
}
POLICY
}

resource "aws_s3_bucket_public_access_block" "S3_Log_BucketPublicAccessBlock" {
  depends_on = [aws_s3_bucket_policy.S3_Log_BucketPolicy]
  bucket = aws_s3_bucket.S3_Log_Bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
