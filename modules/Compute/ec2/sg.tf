
resource "aws_security_group" "project-iac-sg" {
  name = var.Securitygroup_EC2_Name
  description = "Security group for ${var.ApplicationName} -application"
  vpc_id = var.Securitygroup_Vpc_Id

  ingress {
    description = "Access to VPC CIDR"
    from_port = var.Securitygroup_Port
    protocol = "tcp"
    to_port = var.Securitygroup_Port
    cidr_blocks = [var.Securitygroup_Vpc_CIDR]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }


}