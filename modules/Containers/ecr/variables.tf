
variable "Default_Tags" {
  description = "Mapping of tags to assign to the resource"
}
variable "ECR_Scan_on_push" {
  description = "true/false for Enabling/Disabling Scan on push for ecr repository."
}
variable "ECR_Lifecycle_Policy" {
  description = "ECR Lifecycle Policy"
}
variable "ECR_Repository_Name" {
  description = "ECR Repository Name"
}