#####Commom Variable Values #####
AWS_Region  = "us-east-1"
AWS_Region_Code = "usea01"
AWS_Account_Number = "699732404025"
#Terraform_Profile = "IoT"
#"Provide the Application Acronym"
App_AcronymCode = "coe"
#"Provide the environment in which the resources will be hosted"
App_EnvironmentType = "np"
#"Provide the Application ClusterCode"
App_ClusterCode = "ipss"

Default_Tags = {
  ApplicationName      = "Tier_1_COE"
  ApplicationAcronym   = "COE"
  Automation           = "True"
  Environment          = "Nonproduction"
  CloudServiceProvider = "AWS"
  Backup               = "True"
}