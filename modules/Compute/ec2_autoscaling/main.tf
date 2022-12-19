data "aws_ami" "ami" {
  owners           = ["amazon"]
  most_recent      = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "template_file" "user_data" {
  template = file(var.EC2_User_Data_Path)
}

resource "aws_launch_template" "launch_template" {
  name                   = var.LaunchTemplate_Name
  image_id               = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.project-iac-sg.id]
  user_data              = base64encode(data.template_file.user_data.rendered)
  key_name               = var.ssh_key_name

  iam_instance_profile {
    name = aws_iam_instance_profile.default.name
  }
  tag_specifications {
    resource_type = "instance"
    tags = merge(var.Default_Tags, tomap({Name=var.LaunchTemplate_Name}))
  }
}

resource "aws_autoscaling_group" "asg" {
  name                = var.autoscaling_group_name
  max_size            = var.max_ec2_instance_count
  min_size            = var.min_ec2_instance_count
  vpc_zone_identifier = [var.Subnet_ID_AZ1_Private,var.Subnet_ID_AZ1_Private]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = var.autoscaling_group_name
    propagate_at_launch = true
  }
  tag {
    key                 = "ApplicationAcronym"
    value               = var.ApplicationAcronym
    propagate_at_launch = true
  }
  tag {
    key                 = "DevOpsTeam"
    value               = var.DevOpsTeam
    propagate_at_launch = true
  }
  tag {
    key                 = "Truck"
    value               = var.Truck
    propagate_at_launch = true
  }
  tag {
    key                 = "ApplicationName"
    value               = var.ApplicationName
    propagate_at_launch = true
  }
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 90
      instance_warmup = "300"
      skip_matching          = true
    }
    triggers = ["tag"]
  }

}