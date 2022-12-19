resource "aws_security_group" "Securitygroup" {
  name        = var.Securitygroup_Name
  description = var.Securitygroup_Description
  vpc_id      = var.Securitygroup_vpc_Id
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Securitygroup_Name}))
}