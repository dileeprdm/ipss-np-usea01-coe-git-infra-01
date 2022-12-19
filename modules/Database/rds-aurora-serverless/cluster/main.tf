resource "aws_db_subnet_group" "RDS_Subnet_Group" {
  name        = var.RDS_Subnet_Group_Name
  description = "Subnet Group for ${var.App_AcronymCode} RDS ${var.App_EnvironmentType} "
  subnet_ids  = [var.Subnet_ID_AZ1_Trusted, var.Subnet_ID_AZ2_Trusted]
  tags = merge(var.Default_Tags, tomap({Name=var.RDS_Subnet_Group_Name}))
}


resource "aws_rds_cluster_parameter_group" "RDS_Parameter_Group" {
  name   = var.RDS_Cluster_PG_Name
  family = var.RDS_Aurora_Serverless_Family
 tags = merge(var.Default_Tags, tomap({Name=var.RDS_Cluster_PG_Name}))
}

resource "aws_secretsmanager_secret_version" "Secret_Version_RDS_Master" {
  secret_id = var.Secret_Manager_ID
  secret_string = <<EOF
{
  "db.username": "${var.RDS_Database_Master_UserName}",
  "db.password": "${random_password.RDS_Aurora_MasterPassword.result}"
}
EOF
}


resource "random_password" "RDS_Aurora_MasterPassword" {
  length = 16
  special = true
  override_special = "$-*"
}

resource "aws_rds_cluster" "RDS_Cluster" {
  cluster_identifier = var.RDS_Cluster_Name_Serverless
  engine = var.RDS_Engine
  engine_version = var.RDS_Engine_Version
  engine_mode    = var.RDS_Engine_Mode
  availability_zones = [var.Availability_Zone_1a,var.Availability_Zone_1b]
  database_name = var.RDS_Database_Name
  master_username = jsondecode(aws_secretsmanager_secret_version.Secret_Version_RDS_Master.secret_string)["db.username"]
  master_password = jsondecode(aws_secretsmanager_secret_version.Secret_Version_RDS_Master.secret_string)["db.password"]
  backup_retention_period = var.RDS_Backup_Retention_Period
  preferred_backup_window = var.RDS_Preferred_Backup_Window
  copy_tags_to_snapshot = true
  skip_final_snapshot = var.RDS_Skip_Final_Snapshot
  preferred_maintenance_window = var.RDS_Preferred_Maintenance_Window
  port = var.RDS_Database_Port
  vpc_security_group_ids = [var.RDS_Aurora_Securitygroup]
  storage_encrypted  = true
  apply_immediately = true
  deletion_protection = var.Deletion_Protection
  db_subnet_group_name = aws_db_subnet_group.RDS_Subnet_Group.id
  kms_key_id = var.KMS_Key_RDS
  scaling_configuration {
    auto_pause               = var.RDS_Enable_Auto_Pause
    max_capacity             = var.RDS_max_capacity
    min_capacity             = var.RDS_min_capacity
    seconds_until_auto_pause = var.RDS_Seconds_Until_Auto_Pause
    timeout_action           = var.RDS_Timeout_Action
  }
  tags = merge(var.Default_Tags, tomap({Name=var.RDS_Cluster_Name_Serverless}))
  depends_on = [aws_secretsmanager_secret_version.Secret_Version_RDS_Master]
  lifecycle {
    ignore_changes = [availability_zones]
  }
}


