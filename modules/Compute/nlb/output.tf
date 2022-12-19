output "NLB_ID" {
   description = "The ID of the NLB."
   value = aws_lb.NLB.id
}
output "NLB_ARN" {
   description = "The ARN of the NLB."
   value = aws_lb.NLB.arn
}
output "NLB_DNS_Name" {
   description = "The DNS Name of the NLB."
   value = aws_lb.NLB.dns_name
}
output "NLB_ARNsuffix" {
   description = "The ARN suffix of the NLB."
   value = aws_lb.NLB.arn_suffix
}