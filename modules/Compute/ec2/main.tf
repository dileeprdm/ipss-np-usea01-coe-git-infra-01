/*data "aws_ssm_parameters_by_path" "foo" {
  path = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
  with_decryption = false
}*/

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
resource "aws_instance" "project-iac" {
  ami = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.project-iac-sg.id]
  user_data              = base64encode(data.template_file.user_data.rendered)
  iam_instance_profile = aws_iam_instance_profile.default.name
  key_name               = var.ssh_key_name
  subnet_id = var.Subnet_ID_AZ1_Private
  root_block_device {
    delete_on_termination = false
    volume_type = "gp2"
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Server_Name}))

}


