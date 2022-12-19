variable "Codebuild_Project_Name" {
  description = "Codebuild_Project_Name"
}
variable "Codebuild_Project_Description" {
  description = "Codebuild_Project_Description"
}
variable "Codebuild_Project_Build_Timeout" {
  description = "Codebuild_Project_Build_Timeout"
}
variable "Codebuild_Project_Service_Role" {
  description = "Codebuild_Project_Service_Role"
}
variable "Codebuild_Project_Artifact_Type" {
  description = "Codebuild_Project_Artifact_Type"
}
variable "Codebuild_Project_Env_Compute_Type" {
  description = "Codebuild_Project_Env_Compute_Type"
}
variable "Codebuild_Project_Env_Image" {
  description = "Codebuild_Project_Env_Image"
}
variable "Codebuild_Project_Env_Build_Environment_Type" {
  description = "Codebuild_Project_Env_Build_Environment_Type"
}
variable "Codebuild_Project_Env_Image_Pull_Credentials_Type" {
  description = "Codebuild_Project_Env_Image_Pull_Credentials_Type"
}
variable "Codebuild_Project_Env_Variable_Name_1" {
  description = "Codebuild_Project_Env_Variable_Name_1"
}
variable "Codebuild_Project_Env_Variable_Value_1" {
  description = "Codebuild_Project_Env_Variable_Value_1"
}
variable "Codebuild_Project_Env_Variable_Name_2" {
  description = "Codebuild_Project_Env_Variable_Name_1"
}
variable "Codebuild_Project_Env_Variable_Value_2" {
  description = "Codebuild_Project_Env_Variable_Value_1"
}

variable "Codebuild_Project_Cloudwatch_Log_Group_Name" {
  description = "Codebuild_Project_Cloudwatch_Log_Group_Name"
}
variable "Codebuild_Project_Cloudwatch_Log_Group_Retention" {
  description = "Codebuild_Project_Cloudwatch_Log_Group_Name"
}
variable "Codebuild_Project_Source_Type" {
  description = "Codebuild_Project_Source_Type"
}
variable "Codebuild_Project_Source_Location" {
  description = "Codebuild_Project_Source_Location"
}
variable "Codebuild_Project_Source_Git_Clone_Depth" {
  description = "Codebuild_Project_Source_Git_Clone_Depth"
}
variable "Codebuild_Project_Source_Version" {
  description = "Codebuild_Project_Source_Version"
}
variable "VPC_ID" {
  description = "VPC_ID"
}
variable "Subnet_Trusted_A" {
  description = "Subnet_Trusted_A"
}
variable "Subnet_Trusted_B" {
  description = "Subnet_Trusted_B"
}
variable "SecurityGroup_ID" {
  description = "SecurityGroup_ID"
}
variable "Default_Tags" {
  description = "Default_Tags"
}
variable "Codebuild_Project_Source_Buildspec" {
  description = "Code build Project Build spec file"
}
variable "Codebuild_Project_Env_Privileged_Mode" {
  description = "Privileged mode"
}

variable "Codebuild_Project_Artifact_Encryption" {
  description = "Emcryption"
}
variable "Codebuild_Project_Artifact_Location" {
  description = "Artifact_Location"
}