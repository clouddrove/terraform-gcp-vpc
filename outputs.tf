output "vpc_id" {
  value       = join("", google_compute_network.vpc.*.id)
  description = "The outputs of the created VPC."
}