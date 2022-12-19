resource "aws_dynamodb_table" "DynamoDB-Table" {
  name = var.DynamoDB_Table_Name
  billing_mode = var.DynamoDB_Table_Billing_Mode
  hash_key = var.DynamoDB_Table_Hash_Key
  range_key = var.DynamoDB_Table_Range_Key
  read_capacity    = var.DynamoDB_Table_Read_Capacity
  write_capacity   = var.DynamoDB_Table_Write_Capacity
  stream_enabled   = var.DynamoDB_Table_Stream_Enabled
  stream_view_type = var.DynamoDB_Table_Stream_View_type

  ttl {
    enabled        = var.DynamoDB_Table_ttl_enabled
    attribute_name = var.DynamoDB_Table_ttl_attribute_name
  }
  dynamic "attribute" {
    for_each = var.DynamoDB_Table_attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
  dynamic "global_secondary_index" {
    for_each = var.DynamoDB_Table_global_secondary_indexes

    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
    }
  }
  point_in_time_recovery {
    enabled = var.DynamoDB_Point_InTime_Recovery
  }
  server_side_encryption {
    enabled = var.DynamoDB_Table_Enable_Encryption
    kms_key_arn = var.KMS_Key_DynamoDB
  }
  tags = merge(var.Default_Tags, tomap({Name=var.DynamoDB_Table_Name}))
}
