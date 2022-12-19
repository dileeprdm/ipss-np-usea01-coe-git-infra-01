data "template_file" "Cloudwatch_Dashboard_Policy" {
  template = file(var.Cloudwatch_Dashboard_Policy)
}

resource "aws_cloudwatch_dashboard" "Dashboard" {
  dashboard_name = var.Dashboard_Name
  dashboard_body = data.template_file.Cloudwatch_Dashboard_Policy.rendered
}