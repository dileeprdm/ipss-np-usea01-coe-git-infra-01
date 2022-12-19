variable "AWS_Region" {
  description = "Provide the profile name where credentials are stored"
  default="eu-west-1"
  }


variable "SNS_Topic_ARN" {
  description = "Provide the profile name where credentials are stored"
  default="arn:aws:sns:eu-west-1:086243371668:sns-parcels-dv1-euwe01-tfm-test3-01"
  }

  variable "SNS_Protocol" {
  description = "Provide the profile name where credentials are stored"
  default="sqs"
  }
  variable "SNS_endpoint" {
  description = "Provide the profile name where credentials are stored"
  default="arn:aws:sqs:eu-west-1:086243371668:Test-queue"
  }
 
 variable "SNS_raw_message_delivery" {
  description = "Provide the profile name where credentials are stored"
  default=true
  }


