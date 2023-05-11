###### Security################################################

# Description : This Module creates KMS Key
module "KMS" {
  source = "./modules/Security/kms"
  Default_Tags = var.Default_Tags
  KMS_Key_Alias = "kms-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-01"
  KMS_Enable_Key_Rotation = var.KMS_Enable_Key_Rotation
  KMS_Key_Policy = file("packages/policies/KMS_Policy.json")
  KMS_Deletion_Window_In_Days = var.KMS_Deletion_Window_In_Days
}

# Description : The Module creates Secret manager for RDS master and application database credentials

/*module "Secret_Manager" {
  source = "./modules/Security/secretmanager"
  Secret_Manager_Name="asm-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-manager-06"
  App_EnvironmentType = var.App_EnvironmentType
  App_AcronymCode = var.App_AcronymCode
  App_ClusterCode = var.App_ClusterCode
  Default_Tags = var.Default_Tags
  Secret_Recovery_Window_In_Days = var.Secret_Recovery_Window_In_Days
  KMS_Key_Secret = module.KMS.KMS_Key_ARN
  App_Seqnumber = var.App_SequenceNumber
}


# Description : This Module creates the VPC, Subnets, internet and NAT Gateway

module "VPC" {
  source = "./modules/Network & Content_Delivery/vpc"
  Default_Tags              = var.Default_Tags
  vpc_cidr                  = var.VPC_CIDR
  availability_zone         = var.availability_zone
  internet_gateway_name     = "igw-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}"
  nat_gateway_name          = "ngw-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}"
  private_subnet_cidr_block = var.private_subnet_cidr_block
  private_subnet_name       = ["snt-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-az1-prv-${var.App_SequenceNumber}","snt-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-az2-prv-${var.App_SequenceNumber}"]
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  public_subnet_name        = ["snt-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-az1-pub-${var.App_SequenceNumber}","snt-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-az2-pub-${var.App_SequenceNumber}"]
  vpc_name                  = "vpc-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_SequenceNumber}"
}

# Description : This Module creates EC2 in single availability zone

module "EC2" {
  source                 = "./modules/Compute/ec2"
  Securitygroup_EC2_Name= lower("esg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}")
  Default_Tags           = var.Default_Tags
  Securitygroup_Vpc_Id   = module.VPC.vpc_id
  ApplicationName = var.ApplicationName
  Securitygroup_Vpc_CIDR = module.VPC.vpc_cidr
  Securitygroup_Port     = var.Securitygroup_Port
  Server_Name = var.Server_Name
  EC2_User_Data_Path = var.EC2_User_Data_Path
  Subnet_ID_AZ1_Private    = module.VPC.vpc_private_subnet[0]
  instance-role_name = lower("iar-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}")
  instance_type = var.instance_type
  ssh_key_name = var.ssh_key_name
  instance-profile_name = lower("iar-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}")
}
# Description : This Module creates EC2 with autoscaling

module "EC2_Autoscaling" {
  source                 = "./modules/Compute/ec2_autoscaling"
  Securitygroup_EC2_Name= lower("esg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-asg-${var.App_SequenceNumber}")
  Default_Tags           = var.Default_Tags
  Securitygroup_Vpc_Id   = module.VPC.vpc_id
  Securitygroup_Vpc_CIDR = module.VPC.vpc_cidr
  Securitygroup_Port     = var.Securitygroup_Port
  EC2_User_Data_Path = var.EC2_User_Data_Path
  Subnet_ID_AZ1_Private    = module.VPC.vpc_private_subnet[0]
  Subnet_ID_AZ2_Private = module.VPC.vpc_private_subnet[1]
  instance-role_name = lower("iar-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-asg-${var.App_SequenceNumber}")
  instance-profile_name = lower("iar-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-asg-${var.App_SequenceNumber}")
  instance_type = var.instance_type
  ssh_key_name = var.ssh_key_name
  LaunchTemplate_Name = lower("ltl-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}")
  VPC_ID = module.VPC.vpc_id
  autoscaling_group_name = lower("asg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}")
  max_ec2_instance_count = var.max_ec2_instance_count
  min_ec2_instance_count = var.min_ec2_instance_count
}

# Description : This Module creates S3 Bucket for AWS resources logs

module "S3_Log_Bucket" {
  source                            = "./modules/Storage/s3log"
  s3_Log_Bucket_name                = lower("s3b-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-log-${var.App_SequenceNumber}")
  Default_Tags                      = var.Default_Tags
  AWS_Account_Number                = var.AWS_Account_Number
  S3_SSE_Algorithm                  = var.S3_SSE_Algorithm
  S3_Lifecycle_Rule_Status          = var.S3_Lifecycle_Rule_Status
  S3_Lifecycle_Rule_Expiration_Days = var.S3_Lifecycle_Rule_Expiration_Days
  S3_Block_Public_ACLs              = var.S3_Block_Public_ACLs
  S3_Block_Public_Policy            = var.S3_Block_Public_Policy
  S3_Ignore_Public_ACLs             = var.S3_Block_Public_Policy
  S3_Restrict_Public_Buckets        = var.S3_Block_Public_Policy
}

# Description : This Module creates S3-data bucket
module "S3_Data_Bucket" {
  source               = "./modules/Storage/s3data"
  S3_Data_Bucket_name =  lower("s3b-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}")
  Default_Tags         = var.Default_Tags
  S3_Prefix            = var.S3_Prefix
  S3_Enable_Versioning = var.S3_Enable_Versioning
  S3_LogBucket_Id      = module.S3_Log_Bucket.S3_Log_Bucket_ID
  S3_KMS_Key_Secret    = module.KMS.KMS_Key_ARN
}

# This Module creates IAM Policy For Lambda Function
module "Lambda_IAM_Policy" {
  source = "./modules/IAM/iampolicy"
  IAM_Policy = file("packages/policies/IAM_Lambda_Policy.json")
  IAM_Policy_Description = "IAM Policy Grants Permissions for Lambda function"
  IAM_Policy_Name = "iap-lambdafunction-${var.App_AcronymCode}-${var.App_EnvironmentType}-${var.App_SequenceNumber}"
}

# This Module creates IAM Role For Lambda Function
module "Lambda_IAM_Role" {
  source = "./modules/IAM/iamrole"
  Default_Tags = var.Default_Tags
  IAM_Policy_ARN = module.Lambda_IAM_Policy.IAM_Policy_ARN
  IAM_Role_Description = "IAM Role For Lambda Function"
  IAM_Role_Name = "iar-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-LambdaRole-${var.App_SequenceNumber}"
  IAM_Role_Trust_Policy = file("packages/policies/IAM_Lambda_Function_Role_Trust_Policy.json")
}

# This module creates Security group for Lambda function

module "Lambda_Security_Group" {
  source = "./modules/Network & Content_Delivery/securitygroup"
  App_AcronymCode = var.App_AcronymCode
  Default_Tags = var.Default_Tags
  Securitygroup_Name = "lmsg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}"
  Securitygroup_Port = var.Lambda_Port
  Securitygroup_vpc_CIDR = module.VPC.vpc_cidr
  Securitygroup_vpc_Id = module.VPC.vpc_id
}

# This module creates Lambda function
module "Lambda" {
  source = "./modules/Compute/lambda/function"
  Default_Tags = var.Default_Tags
  VPC_ID = module.VPC.vpc_id
  Lambda_Subnet_ID_1A = module.VPC.vpc_private_subnet[0]
  Lambda_Subnet_ID_1B = module.VPC.vpc_private_subnet[1]
  Lambda_Loggroup_Retention = var.Lambda_Loggroup_Retention
  Lambda_Cloudwatch_LogGroup_Name = "cwlg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-lambda-${var.App_SequenceNumber}"
  Lambda_Function_Name = "lmb-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-${var.App_SequenceNumber}"
  Lambda_SG_Name = module.Lambda_Security_Group.Securitygroup_ID
  Lambda_Env = var.Lambda_Env
  IAM_Role_Lambda_function = module.Lambda_IAM_Role.IAM_Role_ARN
  Lambda_S3bucket = module.S3_Data_Bucket.S3_Data_Bucket_ID
  Lambda_Function_Handler = var.Lambda_Function_Handler
  Lambda_Memory_Size = var.Lambda_Memory_Size
  Lambda_Runtime = var.Lambda_Runtime
  Lambda_S3key = var.Lambda_S3key
  Lambda_Timeout = var.Lambda_Timeout
  Lambda_Zip_File_Path = var.Lambda_Zip_File_Path
}

###### Database################################################
# Description : The Module creates RDS cluster security group
module "RDS_Securitygroup" {
  source = "./modules/Database/rds-aurora-serverless/securitygroup"
  RDS_SG_Name= "rsg-${var.App_ClusterCode}-${var.App_EnvironmentType}-euwe01-${var.App_AcronymCode}-${var.App_SequenceNumber}"
  App_EnvironmentType = var.App_EnvironmentType
  App_AcronymCode = var.App_AcronymCode
  App_ClusterCode = var.App_ClusterCode
  Default_Tags = var.Default_Tags
  VPC_ID = module.VPC.vpc_id
  Securitygroup_Vpc_CIDR=module.VPC.vpc_cidr
  EC2_SG_ID=module.EC2.ec2instance_SecurityGroup_ID
  RDS_Database_Port = var.RDS_Aurora_Serverless_Database_Port_MySQL
}
      
# Description : The Module create RDS Aurora Serverless --Need to pass the DB Engine based on requirement: MySQL or PostgreSQL

module "RDS_Aurora_Serverless" {
  source = "./modules/Database/rds-aurora-serverless/cluster"
  App_EnvironmentType = var.App_EnvironmentType
  App_AcronymCode = var.App_AcronymCode
  App_ClusterCode = var.App_ClusterCode
  Default_Tags = var.Default_Tags
  Secret_Manager_ID = module.Secret_Manager.Secret_Manager_ID
  Subnet_ID_AZ1_Trusted = module.VPC.vpc_private_subnet[0]
  Subnet_ID_AZ2_Trusted = module.VPC.vpc_private_subnet[1]
  #Subnet_ID_AZ3_Trusted = module.VPC.vpc_private_subnet[2]
  VPC_ID = module.VPC.vpc_id
  RDS_Subnet_Group_Name = lower("rsn-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-mysql-serverless-${var.App_SequenceNumber}")
  RDS_Cluster_Parameter_Group_Name = lower("rpg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-cluster-mysql-serverless-${var.App_SequenceNumber}")
  RDS_DB_Parameter_Group_Name = lower("rpg-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-db-mysql-serverless-${var.App_SequenceNumber}")
  RDS_Cluster_Name_Serverless = lower("rdc-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-mysql-serverless-${var.App_SequenceNumber}")
  RDS_Cluster_PG_Name  = lower("rdc-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-mysql-serverless-${var.App_SequenceNumber}")
  RDS_Family = var.RDS_Aurora_Serverless_Family_MySQL
  Availability_Zone_1a = var.Availability_Zone_1a
  Availability_Zone_1b = var.Availability_Zone_1b
  #Availability_Zone_1c = var.Availability_Zone_1c
  RDS_Database_Port = var.RDS_Aurora_Serverless_Database_Port_MySQL
  RDS_Backup_Retention_Period = var.RDS_Aurora_Serverless_Backup_Retention_Period
  RDS_Preferred_Backup_Window = var.RDS_Aurora_Serverless_Preferred_Backup_Window
  KMS_Key_RDS = module.KMS.KMS_Key_ARN
  RDS_Engine = var.RDS_Aurora_Serverless_Engine_MySQL # Pass RDS_Aurora_Serverless_Engine_Postgresql variable if Postgres DB need to be created
  RDS_Engine_Version = var.RDS_Aurora_Serverless_Engine_Version_MySQL
  RDS_Engine_Mode=var.RDS_Aurora_Serverless_Engine_Mode
  RDS_Skip_Final_Snapshot = var.RDS_Aurora_Serverless_Skip_Final_Snapshot
  RDS_Preferred_Maintenance_Window = var.RDS_Aurora_Serverless_Preferred_Maintenance_Window
  RDS_max_capacity= var.RDS_Aurora_Serverless_max_capacity
  RDS_min_capacity= var.RDS_Aurora_Serverless_min_capacity
  Deletion_Protection = var.Deletion_Protection
  RDS_Seconds_Until_Auto_Pause= var.RDS_Aurora_Serverless_Seconds_Until_Auto_Pause
  RDS_Timeout_Action= var.RDS_Aurora_Serverless_Timeout_Action
  RDS_Enable_Auto_Pause= var.RDS_Aurora_Serverless_Enable_Auto_Pause
  RDS_Database_Name=var.RDS_Aurora_Serverless_Database_Name
  RDS_Aurora_Serverless_Family = var.RDS_Aurora_Serverless_Family_MySQL
  RDS_Aurora_Securitygroup = module.RDS_Securitygroup.SG_RDS_ID
  RDS_Database_Master_UserName = var.RDS_Aurora_Serverless_Database_Master_UserName
}*/

# Description : The Module create Cloudwatch Alarm for RDS Aurora Serverless MySQL

/*module "CWA_RDS_Aurora_Serverless" {
  source                         = "./modules/Monitoring/Cloudwatch/rds-aurora-serverless-alarm"
  RDS_Cluster = module.RDS_Aurora_Serverless.RDS_DBClusterIdentifier
  RDS_CPU_Alarm_Name             = "cwa-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-rds-cpuhigh-p2-${var.App_SequenceNumber}"
  RDS_Freeable_Memory_Alarm_Name = "cwa-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-rds-freeablemem-p2-${var.App_SequenceNumber}"
  RDS_Max_Capacity_Alarm_Name = "cwa-${var.App_ClusterCode}-${var.App_EnvironmentType}-${var.AWS_Region_Code}-${var.App_AcronymCode}-rds-freeablemem-p2-${var.App_SequenceNumber}"
  ApplicationName                = var.ApplicationName
  Default_Tags                   = var.Default_Tags
}*/
