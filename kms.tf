resource "aws_kms_key" "KMS_Key" {
  description = "KMS key for All Resources"
  deletion_window_in_days = 7
  enable_key_rotation = true
  policy = file("packages/KMS_Policy.json")
  tags = var.Default_Tags
}
resource "aws_kms_alias" "KMS_Key_Alias" {
  name = "alias/kms-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-app-${var.App_AcronymCode}-01"
  target_key_id = aws_kms_key.KMS_Key.id
}