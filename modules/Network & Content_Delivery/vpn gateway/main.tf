resource "aws_vpn_gateway" "vpn_gw" {
  name = var.vpn_gateway_name
  vpc_id = var.vpc_id
  tags = merge(var.Default_Tags, tomap({"Name"= var.vpn_gateway_name}))
}