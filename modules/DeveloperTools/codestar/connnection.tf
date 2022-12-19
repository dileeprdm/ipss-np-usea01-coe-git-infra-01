
resource "aws_codestarconnections_connection" "connnection" {
  name          = var.Codestar_Connection_Name
  provider_type = var.Codestar_Connection_Provider
  tags = merge(var.Default_Tags, map("Name",var.Codestar_Connection_Name))
}