provider "google" {
  project     = var.gcp_project_id
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}

module "vpc" {
  source = "../"

  name        = "vpc"
  environment = var.environment
  label_order = var.label_order

  google_compute_network_enabled         = true
  project_id                             = "dev-env-3b53"
  auto_create_subnetworks                = false
  routing_mode                           = "REGIONAL"
  mtu                                    = 1460
  delete_default_routes_on_create        = true
  enable_ula_internal_ipv6               = false
  google_compute_shared_vpc_host_enabled = true
  host_project_id                        = "dev-env-3b53"
  service_project_id                     = "bamboo-analyst-416214"
}
