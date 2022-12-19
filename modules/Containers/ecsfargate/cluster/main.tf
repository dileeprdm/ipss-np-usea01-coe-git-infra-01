data "aws_subnet" "Subnet_AZ1" {
  id = var.Subnet_ID_AZ1
}

data "aws_subnet" "Subnet_AZ2" {
  id = var.Subnet_ID_AZ2
}

resource "aws_security_group" "SG_ECSFargate_Service" {
  name = var.ECSFargate_Service_SG_Name
  description = "Security group for ${var.App_AcronymCode} application hosted in ECS Fargate Services"
  vpc_id = var.VPC_ID
  ingress {
    description = "Access to AZ1 subnet of NLB"
    from_port = var.ECSFargate_Port_AppService01
    to_port = var.ECSFargate_Port_AppService02
    protocol = "tcp"
    cidr_blocks = [data.aws_subnet.Subnet_AZ1.cidr_block]
  }
  ingress {
    description = "Access to AZ2 subnet of NLB"
    from_port = var.ECSFargate_Port_AppService01
    to_port = var.ECSFargate_Port_AppService02
    protocol = "tcp"
    cidr_blocks = [data.aws_subnet.Subnet_AZ2.cidr_block]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.Default_Tags, tomap({Name=var.ECSFargate_Service_SG_Name}))
}

resource "aws_ecs_cluster" "ECSFargate_Cluster" {
  name = var.ECSFargate_Cluster_Name
  tags = merge(var.Default_Tags, tomap({Name=var.ECSFargate_Cluster_Name, Auto-shutdown=True}))
}
