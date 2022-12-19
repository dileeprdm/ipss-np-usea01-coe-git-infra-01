variable "App_EnvironmentType" {
  description = "Provide the environment in which the resources will be hosted"
}
variable "App_AcronymCode" {
  description = "Provide the Application Acronymcode"
}
variable "App_ClusterCode" {
  description = "Provide the Application ClusterCode"
}
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}

/*variable "Subnet_ID_AZ3_Trusted" {
  description = "Provide eu-west-1c(AZ3) Availability Zone trusted subnet ID"
}*/
variable "VPC_ID" {
  description = "Provide VPC ID in which resouces will be hosted"
}

variable "RDS_Subnet_Group_Name" {
  description = "Provide RDS Subnet Group Name"
}
variable "RDS_Cluster_Parameter_Group_Name" {
  description = "Provide RDS Cluster Parameter Group Name"
}
variable "RDS_DB_Parameter_Group_Name" {
  description = "Provide RDS DB Parameter Group Name"
}
variable "Subnet_ID_AZ1_Trusted" {
  description = "Provide eu-west-1a(AZ1) Availability Zone trusted subnet ID"
}
variable "Subnet_ID_AZ2_Trusted" {
  description = "Provide eu-west-1b(AZ2) Availability Zone trusted subnet ID"
}

variable "RDS_Aurora_Securitygroup" {
  default = ""
}
variable "RDS_Cluster_Name_Serverless" {
  description = "Provide RDS Cluster Name"
}
variable "Availability_Zone_1a" {
  description = "Provide AWS Region Availability Zones 1a name"
}
variable "Availability_Zone_1b" {
  description = "Provide AWS Region Availability Zones 1b name"
}
/*variable "Availability_Zone_1c" {
  description = "Provide AWS Region Availability Zones 1c name"
}*/
variable "RDS_Database_Port" {
  description = "Provide RDS database port"
}
variable "RDS_Family" {
  description = "Provide RDS family of the DB cluster parameter group"
}
variable "RDS_Engine" {
  description = "Provide RDS Engine details"
}
variable "RDS_Engine_Version" {
  description = "Provide RDS Engine version details"
}
variable "RDS_Database_Name" {
  description = "Provide RDS database Name"
}
variable "RDS_Backup_Retention_Period" {
  description = "Provide RDS database backup retention period "
}
variable "RDS_Preferred_Backup_Window" {
  description = "Provide RDS database preferred backup window "
}
variable "RDS_Preferred_Maintenance_Window" {
  description = "Provide the database Preferred maintenance window of the RDS database"
}
variable "KMS_Key_RDS" {
  description = "Provide RDS kms key ID ARN"
}
variable "RDS_Skip_Final_Snapshot" {
  description = "Specify if RDS final snapshot needs to be skipped"
}
variable "RDS_Database_Master_UserName" {
  description = "Provide RDS database username"
}

variable "Secret_Manager_ID" {
}
variable "Deletion_Protection" {
  description = "Specify if deletion protection needs to be enabled"
}

variable "RDS_Engine_Mode" {
  description = "Specify the RDS Engine mode"
}
variable "RDS_max_capacity" {
  description = "Specify the RDS Max Capacity"
}
variable "RDS_min_capacity" {
  description = "Specify the RDS Min Capacity"
}
variable "RDS_Seconds_Until_Auto_Pause" {
  description = "Specify the RDS Autopause"
}
variable "RDS_Timeout_Action" {
  description = "Specify the RDS Timeout action"
}
variable "RDS_Enable_Auto_Pause" {
  description = "Specify the RDS Timeout action"
}

variable "RDS_Aurora_Serverless_Family" {
  description = "Specify family for RDS cluster"
}

variable "RDS_Cluster_PG_Name" {
  default = ""
}
