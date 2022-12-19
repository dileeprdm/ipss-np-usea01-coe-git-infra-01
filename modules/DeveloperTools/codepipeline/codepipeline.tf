resource "aws_codepipeline" "codepipeline" {
    name     = var.Codepipeline_Name
    role_arn = var.Codepipeline_Role_ARN

  artifact_store {
    location = var.Codepipeline_Artifact_Location
    type     = var.Codepipeline_Artifact_Type

  }

  stage {
    name = "Source"

    action {
      name             = var.Codepipeline_Stage_Source_Action_Name
      category         = var.Codepipeline_Stage_Source_Action_Category
      owner            = var.Codepipeline_Stage_Source_Action_Owner
      provider         = var.Codepipeline_Stage_Source_Action_Provider
      version          = var.Codepipeline_Stage_Source_Action_Version
      output_artifacts = ["SourceArtifact"]
      namespace = var.Codepipeline_Stage_Source_Action_Namespace

      configuration = {
        ConnectionArn    = var.Codepipeline_Stage_Source_Action_Config_Connection_Arn
        FullRepositoryId = var.Codepipeline_Stage_Source_Action_Config_FullRepositoryId
        BranchName       = var.Codepipeline_Stage_Source_Action_Config_BranchName
        DetectChanges = var.DetectChanges
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Manual_Approval"
    action {
      name            = var.Codepipeline_Stage_Approval_Action_Name
      category        = var.Codepipeline_Stage_Approval_Action_Category
      owner           = var.Codepipeline_Stage_Approval_Action_Owner
      provider        = var.Codepipeline_Stage_Approval_Action_Provider
      version          = var.Codepipeline_Stage_Build_Action_Version

      configuration = {
        NotificationArn = var.Codepipeline_Stage_Approval_Role_ARN
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = var.Codepipeline_Stage_Build_Action_Name
      category         = var.Codepipeline_Stage_Build_Action_Category
      owner            = var.Codepipeline_Stage_Build_Action_Owner
      provider         = var.Codepipeline_Stage_Build_Action_Provider
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = var.Codepipeline_Stage_Build_Action_Version
      namespace        = var.Codepipeline_Stage_Build_Action_Namespace


      configuration = {
        ProjectName = var.Codepipeline_Stage_Build_Action_Config_ProjectName
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = var.Codepipeline_Stage_Deploy_Action_Name
      category        = var.Codepipeline_Stage_Deploy_Action_Category
      owner           = var.Codepipeline_Stage_Deploy_Action_Owner
      provider        = var.Codepipeline_Stage_Deploy_Action_Provider
      input_artifacts = ["SourceArtifact","BuildArtifact"]
      version         = var.Codepipeline_Stage_Deploy_Action_Version

      configuration = {
        ApplicationName = var.Codepipeline_Stage_Deploy_Action_Config_ApplicationName
        DeploymentGroupName = var.Codepipeline_Stage_Deploy_Action_Config_DeploymentGroupName
        TaskDefinitionTemplateArtifact = var.Codepipeline_Stage_Deploy_Action_Config_TaskDefinitionTemplateArtifact
        AppSpecTemplateArtifact = var.Codepipeline_Stage_Deploy_Action_Config_AppSpecTemplateArtifact
        AppSpecTemplatePath =var.Codepipeline_Stage_Deploy_Action_Config_AppSpecTemplatePath
        TaskDefinitionTemplatePath = var.Codepipeline_Stage_Deploy_Action_Config_TaskDefinitionTemplatePath
        Image1ArtifactName = "BuildArtifact"
        Image1ContainerName = "IMAGE_NAME"
      }
    }
  }
  tags = merge(var.Default_Tags, tomap({Name=var.Codepipeline_Name}))
}


