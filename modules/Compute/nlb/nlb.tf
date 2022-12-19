resource "aws_lb" "NLB" {
  name = var.NLB_Name
  internal = var.NLB_Internal
  load_balancer_type = var.NLB_Type
  subnet_mapping {
    subnet_id = var.Subnet_ID_AZ1
  }
  subnet_mapping {
    subnet_id = var.Subnet_ID_AZ2
  }

  enable_cross_zone_load_balancing = var.NLB_Cross_Zone
  enable_deletion_protection = var.Deletion_Protection
  access_logs {
    bucket = var.S3_Log_Bucket_ID
    prefix = var.NLB_Access_Logs_Prefix
    enabled = var.NLB_Access_Logs_Enable
  }
  tags = merge(var.Default_Tags, tomap({Name=var.NLB_Name}))
}