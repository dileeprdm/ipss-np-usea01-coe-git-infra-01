variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "User_Name" {
  type        = list(string)
  default = []
}