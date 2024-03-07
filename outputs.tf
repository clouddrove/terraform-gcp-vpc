#-------------------------------------------------------------------------------
# Output_VPC_ID #
#-------------------------------------------------------------------------------

output "vpc_id" {
  value       = join("", google_compute_network.vpc[*].id)
  description = "The outputs of the created VPC."
}

#-------------------------------------------------------------------------------
# Output_shared_vpc_#
#-------------------------------------------------------------------------------


output "host_project_id" {
  value       = google_compute_shared_vpc_host_project.host[*].project
  description = "The ID of the Google Cloud project acting as the host project for the Shared VPC."
}

output "service_project_id" {
  value       = google_compute_shared_vpc_service_project.service1[*].service_project
  description = "The ID of the Google Cloud project acting as the service project for the Shared VPC."
}

