variable "public_subnet_cidr_block" {
  description = "Map of AZ to a number that should be used for public subnets"
  type = list(string)
  default = []
}
variable "private_subnet_cidr_block" {
  description = "Map of AZ to a number that should be used for private subnets"
  type = list(string)
  default = []
}
variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = ""
}
variable "vpc_name" {
  description = "VPC ID name"
}
variable "public_subnet_name" {
  description = "public subnet name"
  type        = list(string)
  default = []
}
variable "private_subnet_name" {
  description = "private subnet name"
  type        = list(string)
  default = []
}
variable "availability_zone" {
  description = "Availability Zone"
  type = list(string)
  default = []
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resources"
}
variable "internet_gateway_name" {
  description = "Internet Gateway name"
}
variable "nat_gateway_name" {
  description = "NAT Gateway name"
}
