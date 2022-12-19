
resource "aws_iam_user" "users" {
  count = length(var.User_Name)
  name = var.User_Name[count.index]
  tags = merge(var.Default_Tags, tomap({ Name=User_Name[count.index]}))
}