variable "RDS_Cluster" {
  default = ""
}

variable "ApplicationName" {
  description = "Provide the ApplicationName"
}

variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}

variable "RDS_CPU_Alarm_Name" {
  default = ""
}
variable "RDS_Freeable_Memory_Alarm_Name" {
  default = ""
}
variable "SNS_Alarm_ARN" {
  default = ""
}


