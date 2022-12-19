resource "aws_kms_key" "KMS_Key" {
  description = "KMS key for All Resources"
  deletion_window_in_days = var.KMS_Deletion_Window_In_Days
  enable_key_rotation = var.KMS_Enable_Key_Rotation
  policy = var.KMS_Key_Policy
  tags = merge(var.Default_Tags, tomap({Name=var.KMS_Key_Alias}))
}
resource "aws_kms_alias" "KMS_Key_Alias" {
  name = "alias/${var.KMS_Key_Alias}"
  target_key_id = aws_kms_key.KMS_Key.id
}