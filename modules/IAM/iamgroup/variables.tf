variable "user_list" {
  description = "List of IAM users to add to the group."
  type        = list(string)
  default     = []
}

variable "group_name" {
  description = "The name of the group to be created."
  type        = string
}

/*variable "allowed_roles" {
  description = "The roles that this group is allowed to assume."
  type        = list(string)
}*/
variable "IAM_Admin_Policy" {
  default = ""
}
variable "IAM_Developer_Policy" {
  default = ""
}
variable "admin_policy_template" {
  default = ""
}
variable "developer_policy_template" {
  default = ""
}
variable "tester_policy_template" {
  default = ""
}