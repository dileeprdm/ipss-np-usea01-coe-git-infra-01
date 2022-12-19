resource "aws_security_group" "Securitygroup" {
  name        = var.Securitygroup_Name
  description = "Security group for lambda"
  vpc_id      = var.Securitygroup_vpc_Id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = var.Securitygroup_Port
    to_port     = var.Securitygroup_Port
    protocol    = "tcp"
    cidr_blocks = [var.Securitygroup_vpc_CIDR]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Securitygroup_Name}))
}