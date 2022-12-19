
resource "aws_sns_topic_subscription" "sns-topic" {
  topic_arn =var.SNS_Topic_ARN
  protocol  = var.SNS_Protocol
  endpoint  = var.SNS_endpoint
  raw_message_delivery= var.SNS_raw_message_delivery
}
