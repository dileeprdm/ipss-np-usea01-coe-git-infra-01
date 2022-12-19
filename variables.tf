#Variable values commonly used across different terraform modules
#-----------------------------------------------------------------------------------------------------------------------
variable "AWS_Region" {
  description = "Provide the AWS Region in which resources will be hosted"
}
variable "AWS_Account_Number" {
  description = "Provide the AWS account number in which resources will be hosted"
}
variable "AWS_Region_Code" {
  description = "Provide the Application Region Code"
}
variable "App_SequenceNumber" {
  description = "Provide the Application Acronymcode"
}
variable "Terraform_Profile" {
  description = "Provide the profile name used for Terraform deployment"
}

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
  description = "Provide Mapping of tags which can be commonly used to assign to the resources"
}

# Variable values used by VPC, Subnets

variable "VPC_CIDR" {
  description = "specify vpc CIDR to attach with securitygroup"
}
variable "availability_zone" {
  description = "Availability Zone"
  type = list(string)
  default = []
}
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
# Variable values used by EC2 Security Group terraform modules
#-----------------------------------------------------------------------------------------------------------------------

variable "Securitygroup_Port" {
  description = "specify security group port"
}

#Variable values used by EC2
#-----------------------------------------------------------------------------------------------------------------------
variable "instance_type" {
  default = ""
}
variable "ssh_key_name" {
  description = "Specify ssh_key_name"
}

variable "Server_Name" {
  default = ""
}
variable "EC2_User_Data_Path" {
  default = ""
}
variable "ApplicationName" {
  default = ""
}

####Variable value used by EC2 with autoscaling################################################################

variable "max_ec2_instance_count" {
  description = "Specify security_group_id"
}
variable "min_ec2_instance_count" {
  description = "Specify security_group_id"
}

#################KMS############################################################################################

variable "KMS_Deletion_Window_In_Days" {
  description = "Specify kms Key deletion window in days"
}
variable "KMS_Enable_Key_Rotation" {
  description = "Specify if kms Key needs to be rotated"
}
############Secret Manager#############################################################################

variable "Secret_Recovery_Window_In_Days" {
  default = ""
}

#Variable values for S3_Log terraform module
#-----------------------------------------------------------------------------------------------------------------------
variable "S3_SSE_Algorithm" {
  description = "Provide S3 server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
}
variable "S3_Lifecycle_Rule_Status" {
  description = "Specifies S3 lifecycle rule enabled status"
}
variable "S3_Lifecycle_Rule_Expiration_Days" {
  description = "Specifies the number of days after object creation when the specific rule action takes effect"
}
variable "S3_Versioning_Enable" {
  description = "Specify if S3 Bucket Versioning needs to be enabled"
}

variable "S3_Lifecycle_Rule_NonCurrent_Expiration_Days" {
  description = "Specifies the number of days after object creation when the specific rule action takes effect for non current version"
}
variable "S3_Block_Public_ACLs" {
  description = "Specify if S3 block public acls needs to be enabled"
}

variable "S3_Block_Public_Policy" {
  description = "Specify if S3 block public policy needs to be enabled"
}
variable "S3_Ignore_Public_ACLs" {
  description = "Specify if S3 ignore public acls needs to be enabled"
}
variable "S3_Restrict_Public_Buckets" {
  description = "Specify if S3 restrict public buckets needs to be enabled"
}
#Variable values for S3_Data terraform module
#-----------------------------------------------------------------------------------------------------------------------
variable "S3_Prefix" {
  description = "Prefix for s3 data bucket"
}
variable "S3_Enable_Versioning" {
  description = "Specify if we need to enable versioning for s3 bucket"
}

############Lambda Security Group#############################################################################
variable "Lambda_Port" {
  default = ""
}

############Lambda #############################################################################


variable "Lambda_Runtime" {
  description = "Specify runtime for lambda function"
}
variable "Lambda_Loggroup_Retention" {
  description = "Specify retention period for log groups"
}

variable "Lambda_S3key" {
  description = "Specify path in s3 bucket contains zip code"
}
variable "Lambda_Zip_File_Path" {
  description = "specify s3 bucket  zip file path"
}
variable "Lambda_Env" {
  description = "Environment for Lambda function"
}
variable "Lambda_Function_Handler" {
  description = "Lambda Function Handler"
}
variable "Lambda_Memory_Size" {
  description = "Lambda Function Memory_Size"
}
variable "Lambda_Timeout" {
  description = "Lambda Function Timeout"
}

#Variable values for RDS aurora Serverless MySQL
#-----------------------------------------------------------------------------------------------------------------------

variable "Availability_Zone_1a" {
  description = "Provide AWS Region Availability Zones 1a name"
}

variable "RDS_Aurora_Serverless_Database_Master_UserName" {
  default = ""
}

variable "RDS_Aurora_Serverless_Enable_Auto_Pause" {
  default = ""
}
variable "RDS_Aurora_Serverless_Timeout_Action" {
  default = ""
}
variable "RDS_Aurora_Serverless_Family" {
  default = ""
}
variable "RDS_Aurora_Serverless_min_capacity" {
  default = ""
}
variable "RDS_Aurora_Serverless_max_capacity" {
  default = ""
}

variable "RDS_Aurora_Serverless_Database_Name" {
  description = "Provide RDS database Name"
}
variable "RDS_Aurora_Serverless_Skip_Final_Snapshot" {
  description = "Specify if RDS final snapshot needs to be skipped"
}
variable "RDS_Aurora_Serverless_Backup_Retention_Period" {
  description = "Provide RDS database backup retention period "
}
variable "RDS_Aurora_Serverless_Preferred_Backup_Window" {
  description = "Provide RDS database preferred backup window "
}
variable "RDS_Aurora_Serverless_Preferred_Maintenance_Window" {
  description = "Provide the database Preferred maintenance window of the RDS database"
}
variable "RDS_Aurora_Serverless_Engine_Mode" {
  description = "Specify the RDS Engine mode"
}

variable "RDS_Aurora_Serverless_Seconds_Until_Auto_Pause" {
  description = "Specify the RDS Auto pause"
}


variable "RDS_Aurora_Serverless_Family_MySQL" {
  description = "Specify the RDS Family"
}
variable "RDS_Aurora_Serverless_Database_Port_MySQL" {
  description = "Specify the Database Port Number"
}
variable "RDS_Aurora_Serverless_Engine_MySQL" {
  description = "Specify the RDS Engine"
}
variable "RDS_Aurora_Serverless_Engine_Version_MySQL" {
  description = "Specify the RDS Version"
}

variable "Deletion_Protection" {
  default = ""
}

variable "Availability_Zone_1b" {
  default = ""
}

