output "id" {
  value       = module.vpc[*].vpc_id
  description = "The ID of the VPC."
}

output "host_project_id" {
  value       = module.vpc.host_project_id
  description = "The ID of the Google Cloud project acting as the host project for the Shared VPC."
}

output "service_project_id" {
  value       = module.vpc.service_project_id
  description = "The ID of the Google Cloud project acting as the service project for the Shared VPC."
}
