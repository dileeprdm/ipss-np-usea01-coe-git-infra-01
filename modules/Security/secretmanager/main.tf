## Secret manager

resource "aws_secretsmanager_secret" "Secret_Manager" {
  name = var.Secret_Manager_Name
  description = "Secret manager for ${var.App_AcronymCode} RDS master"
  kms_key_id = var.KMS_Key_Secret
  recovery_window_in_days = var.Secret_Recovery_Window_In_Days
  tags = merge(var.Default_Tags, tomap({Name=var.Secret_Manager_Name}))
}
