## security group

resource "aws_security_group" "SG_RDS" {
  name = var.RDS_SG_Name
  description = "Security group for ${var.App_AcronymCode} application hosted in RDS"
  vpc_id = var.VPC_ID

  ingress {
    description = "Access from other resource SG "
    from_port = var.RDS_Database_Port
    to_port = var.RDS_Database_Port
    protocol = "tcp"
    security_groups = [var.EC2_SG_ID]
  }
  ingress {
    description = "Access to VPC CIDR"
    from_port   = var.RDS_Database_Port
    to_port     = var.RDS_Database_Port
    protocol    = "tcp"
    cidr_blocks = [var.Securitygroup_Vpc_CIDR]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.Default_Tags, tomap({Name=var.RDS_SG_Name}))
}
