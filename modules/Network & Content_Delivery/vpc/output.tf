output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}
output "vpc_public_subnet" {
value = aws_subnet.public.*.id
  }
output "vpc_private_subnet" {
  value = aws_subnet.private.*.id
  }