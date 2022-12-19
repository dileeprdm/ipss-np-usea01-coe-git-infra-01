resource "aws_iam_role" "IAM_Role" {
  name = var.IAM_Role_Name
  description = var.IAM_Role_Description
  assume_role_policy = var.IAM_Role_Trust_Policy
  tags = merge(var.Default_Tags, tomap({Name=var.IAM_Role_Name}))
}
resource "aws_iam_role_policy_attachment" "Iampolicyattach" {
  role       = aws_iam_role.IAM_Role.name
  policy_arn = var.IAM_Policy_ARN
}