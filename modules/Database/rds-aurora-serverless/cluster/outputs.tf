output "RDS-ARN" {
  value = aws_rds_cluster.RDS_Cluster.arn
  description = "RDS DB cluster arn"
}
output "RDS_DBClusterIdentifier" {
  description = "DBClusterIdentifier of the RDS cluster instance."
  value = aws_rds_cluster.RDS_Cluster.id
}

output "RDS_Instance_Endpoint" {
  description = "Endpoint address of the RDS cluster instance."
  value = aws_rds_cluster.RDS_Cluster.endpoint
}
output "RDS_Instance_Reader_Endpoint" {
  description = "Endpoint address of Read-only instance."
  value = aws_rds_cluster.RDS_Cluster.reader_endpoint
}

