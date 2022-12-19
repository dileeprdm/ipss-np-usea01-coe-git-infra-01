resource "aws_cloudwatch_log_group" "LogGroup" {
  name              = var.Codebuild_Project_Cloudwatch_Log_Group_Name
  retention_in_days = var.Codebuild_Project_Cloudwatch_Log_Group_Retention
  tags = merge(var.Default_Tags, tomap({Name=var.Codebuild_Project_Cloudwatch_Log_Group_Name}))
}

resource "aws_codebuild_project" "codebuild" {
  name          = var.Codebuild_Project_Name
  description   = var.Codebuild_Project_Description
  build_timeout = var.Codebuild_Project_Build_Timeout
  service_role  = var.Codebuild_Project_Service_Role
  source_version = var.Codebuild_Project_Source_Version

  artifacts {
     type = var.Codebuild_Project_Artifact_Type
     encryption_disabled = var.Codebuild_Project_Artifact_Encryption
     location = var.Codebuild_Project_Artifact_Location
     namespace_type = "NONE"
     override_artifact_name = false
     packaging = "NONE"
     name = var.Codebuild_Project_Name
  }
  environment {
    compute_type                = var.Codebuild_Project_Env_Compute_Type
    image                       = var.Codebuild_Project_Env_Image
    type                        = var.Codebuild_Project_Env_Build_Environment_Type
    image_pull_credentials_type = var.Codebuild_Project_Env_Image_Pull_Credentials_Type
    privileged_mode = var.Codebuild_Project_Env_Privileged_Mode

    environment_variable {
      name  = var.Codebuild_Project_Env_Variable_Name_1
      value = var.Codebuild_Project_Env_Variable_Value_1
    }
    environment_variable {
      name  = var.Codebuild_Project_Env_Variable_Name_2
      value = var.Codebuild_Project_Env_Variable_Value_2
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = aws_cloudwatch_log_group.LogGroup.name
    }
  }

  source {
    type            = var.Codebuild_Project_Source_Type
    location        = var.Codebuild_Project_Source_Location
    git_clone_depth = var.Codebuild_Project_Source_Git_Clone_Depth
    buildspec = var.Codebuild_Project_Source_Buildspec

    git_submodules_config {
      fetch_submodules = true
    }
  }

  vpc_config {
    vpc_id = var.VPC_ID

    subnets = [
      var.Subnet_Trusted_A,
      var.Subnet_Trusted_B
    ]

    security_group_ids = [
      var.SecurityGroup_ID
    ]
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Codebuild_Project_Name}))
}