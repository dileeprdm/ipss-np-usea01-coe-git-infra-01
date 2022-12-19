output "SG_RDS_ID" {
  description = "Security group ID for RDS."
  value = aws_security_group.SG_RDS.id
}
