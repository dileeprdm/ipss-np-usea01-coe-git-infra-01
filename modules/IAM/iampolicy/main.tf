resource "aws_iam_policy" "Iam_Policy" {
  name        = var.IAM_Policy_Name
  description = var.IAM_Policy_Description
  policy = var.IAM_Policy
}