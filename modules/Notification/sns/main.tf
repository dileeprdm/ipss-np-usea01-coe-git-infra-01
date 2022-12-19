resource "aws_sns_topic" "SNS_Topic_Notification" {
  name = var.SNS_Name
  display_name = var.SNS_Name
  kms_master_key_id=var.kms_master_key_id
  tags = merge(var.Default_Tags, tomap({Name= var.SNS_Name}))
}