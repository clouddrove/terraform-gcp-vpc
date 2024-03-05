output "vpc_id" {
  value       = join("", google_compute_network.vpc.*.id)
  description = "The outputs of the created VPC."
}

# shared_vpc_output #

/*output "project" {
  value       =  google_compute_shared_vpc_host_project.host.project
  description = "Host project ID"
}*/