resource "aws_ecr_repository" "ECR" {
  image_scanning_configuration {
    scan_on_push = var.ECR_Scan_on_push
  }
  name = var.ECR_Repository_Name
  tags = merge(var.Default_Tags, tomap({Name=var.ECR_Repository_Name}))
}

resource "aws_ecr_lifecycle_policy" "recr_ecsfargate_lifecycle_policy" {
  repository = aws_ecr_repository.ECR.name
  policy = var.ECR_Lifecycle_Policy
}
