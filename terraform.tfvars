#Variable values commonly used across different terraform modules
#-----------------------------------------------------------------------------------------------------------------------
#Provide the AWS Region in which resources will be hosted"
AWS_Region = "us-east-1"
#Provide the Application RegionCode"
AWS_Region_Code="usea01"
#Provide the AWS account number in which resources will be hosted"
AWS_Account_Number = "699732404025"
#Provide the profile name used for Terraform deployment"
Terraform_Profile = "IOT"
#Provide the Application Acronymcode"
App_AcronymCode = "coe"
#Provide the environment in which the resources will be hosted"
App_EnvironmentType = "np"
#Provide the Application ClusterCode"
App_ClusterCode = "ipss"
#AWS resource SequenceNumber
App_SequenceNumber="02"

#ApplicationName
ApplicationName ="Tier_1_COE"
#Provide Mapping of tags which can be commonly used to assign to the resources"

Default_Tags = {
  ApplicationName = "Tier_1_COE",
  ApplicationSupport = "xxx@tcs.com",
  ManagedBy = "TCS",
  CloudServiceProvider = "AWS",
  DataProfile = "Internal",
  Backup = "True",
  ApplicationAcronym = "COE",
  Environment = "Development",
  DRLevel = "2"
  BusinessUnit = "IPSS"
  Automation = "True"
  DevOpsTeam = "BLD_IPSS"
}

##########Secret Manager variable Values############################################################
Secret_Recovery_Window_In_Days = "7"

##########KMS variable Values############################################################
#Specify kms Key deletion window in days
KMS_Deletion_Window_In_Days = "7"
#Specify if kms Key needs to be rotated"
KMS_Enable_Key_Rotation = true

##Provide values for VPC and subnets ranges to create

VPC_CIDR = "10.0.0.0/16"
availability_zone = ["us-east-1a","us-east-1b"]
public_subnet_cidr_block = ["10.0.1.0/24","10.0.2.0/24"]
private_subnet_cidr_block = ["10.0.3.0/24", "10.0.4.0/24"]

# Variable values used by EC2 Security Group terraform modules
#-----------------------------------------------------------------------------------------------------------------------
Securitygroup_Port = "80"

# Variable values used by EC2
#-----------------------------------------------------------------------------------------------------------------------
instance_type="t2.micro"
EC2_User_Data_Path = "packages/user_data.config.tpl"
ssh_key_name="EC2-demo"
max_ec2_instance_count = 2
min_ec2_instance_count =1


#Variable values for S3 Log bucket terraform module
#-----------------------------------------------------------------------------------------------------------------------
#"Provide S3 server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
S3_SSE_Algorithm = "AES256"
#"Specifies S3 lifecycle rule enabled status"
S3_Lifecycle_Rule_Status = true
#"Specifies the number of days after object creation when the specific rule action takes effect
S3_Lifecycle_Rule_Expiration_Days = "2"
#"Specify if S3 Bucket Versioning needs to be enabled"
S3_Versioning_Enable = true
#"Specifies the number of days after object creation when the specific rule action takes effect for non current version"
S3_Lifecycle_Rule_NonCurrent_Expiration_Days = "2"
#"Specify if S3 block public acls needs to be enabled"
S3_Block_Public_ACLs = true
#"Specify if S3 block public policy needs to be enabled"
S3_Block_Public_Policy = true
#"Specify if S3 ignore public acls needs to be enabled"
S3_Ignore_Public_ACLs = true
#"Specify if S3 restrict public buckets needs to be enabled"
S3_Restrict_Public_Buckets = true

#Variable values for S3 data bucket terraform module
#-----------------------------------------------------------------------------------------------------------------------
#Specify if S3 Bucket Versioning needs to be enabled"
S3_Enable_Versioning = true
#Specify S3 Bucket's prefix value"
S3_Prefix = "s3_key"

# Variable values used by Lambda
#-----------------------------------------------------------------------------------------------------------------------

#Specify values for Lambda Security group
Lambda_Port = 443

#Specify values for Lambda function
Lambda_Loggroup_Retention = "3"
Lambda_Env = "Dev"
Lambda_Function_Handler = "build/index.handler"
#Specify the memory size required in MB
Lambda_Memory_Size = "512"
#Specify the lambda runtime version node or python
Lambda_Runtime = "nodejs16.x"
#Specify the bucket name where the lambda zip code is uploaded
Lambda_S3key = "s3_key/app.zip"
Lambda_Timeout = "180"
Lambda_Zip_File_Path= "packages/lambda-index.zip"

####################RDS -Aurora-Serverless-MySQL################################################

#"Provide RDS database Name"
RDS_Aurora_Serverless_Database_Name = "DB_Name"
#Provide RDS database Master user Name"
RDS_Aurora_Serverless_Database_Master_UserName = "db_master_name"
#"Specify if RDS final snapshot needs to be skipped"
RDS_Aurora_Serverless_Skip_Final_Snapshot = true
#"Provide RDS database backup retention period"
RDS_Aurora_Serverless_Backup_Retention_Period = "1"
#"Provide RDS database preferred backup window"
RDS_Aurora_Serverless_Preferred_Backup_Window = "23:00-23:30"
#"Provide the database Preferred maintenance window of the RDS database"
RDS_Aurora_Serverless_Preferred_Maintenance_Window = "sat:02:00-sat:02:30"
#"Provide RDS database port"
RDS_Aurora_Serverless_Database_Port_MySQL = "3306"
#"Provide RDS family of the DB cluster parameter group"
RDS_Aurora_Serverless_Family_MySQL = "aurora-mysql5.7"
#provide rds cluster version
RDS_Cluster_Version = "10.14"

#"Provide RDS Engine details"
RDS_Aurora_Serverless_Engine_MySQL = "aurora-mysql"
RDS_Aurora_Serverless_Engine_Postgresql = "aurora-postgresql"
#"Provide RDS Engine version details"
RDS_Aurora_Serverless_Engine_Version_MySQL           = "5.7.serverless_mysql_aurora.2.08.3"
RDS_Aurora_Serverless_min_capacity            = 2
RDS_Aurora_Serverless_max_capacity           = 4
RDS_Aurora_Serverless_Engine_Mode             = "serverless"
RDS_Aurora_Serverless_Seconds_Until_Auto_Pause = "1800"
RDS_Aurora_Serverless_Timeout_Action        = "RollbackCapacityChange"
RDS_Aurora_Serverless_Enable_Auto_Pause        = "true"
Availability_Zone_1a  = "us-east-1a"
Availability_Zone_1b  = "us-east-1b"

#Specify if deletion protection needs to be enabled for the resource"
Deletion_Protection = "true"

