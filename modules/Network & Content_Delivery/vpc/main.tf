resource "aws_vpc" "vpc" {
  #name = var.vpc_name
  cidr_block = var.vpc_cidr
  tags = merge(var.Default_Tags, tomap({"Name"= var.vpc_name}))
}
resource "aws_subnet" "public" {
  #name = var.public_subnet_name[count.index]
  count = length(var.public_subnet_cidr_block)
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.public_subnet_cidr_block[count.index]
  tags = merge(var.Default_Tags, tomap({"Name"= var.public_subnet_name[count.index]}))
}
resource "aws_subnet" "private" {
  #name = var.private_subnet_name[count.index]
  count = length(var.private_subnet_cidr_block)
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.private_subnet_cidr_block[count.index]
  tags = merge(var.Default_Tags, tomap({"Name"= var.private_subnet_name[count.index]}))
}
/*resource "aws_internet_gateway" "igw" {
  #name = var.internet_gateway_name
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.Default_Tags, tomap({"Name"= var.internet_gateway_name}))
}*/

/*resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id = aws_vpc.vpc.id
  #tags = merge(var.Default_Tags, tomap({"Name"= var.internet_gateway_name}))
}*/

/*
resource "aws_nat_gateway" "natgw" {
  #name = var.nat_gateway_name
  subnet_id = aws_subnet.public[0].id
  connectivity_type = "private"
  tags = merge(var.Default_Tags, tomap({"Name"= var.nat_gateway_name}))
}*/