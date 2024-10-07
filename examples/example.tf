provider "google" {
  project     = var.gcp_project_id
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}

#-------------------------------------------------------------------------------
# Module "vpc" Configuration
#-------------------------------------------------------------------------------

module "vpc" {
  source = "../"

  name        = "vpc"
  environment = var.environment
  label_order = var.label_order

  google_compute_network_enabled         = true
  project_id                             = "clouddrove-1"
  auto_create_subnetworks                = false
  routing_mode                           = "REGIONAL"
  mtu                                    = 1460
  delete_default_routes_on_create        = true
  enable_ula_internal_ipv6               = false
  google_compute_shared_vpc_host_enabled = false
  host_project_id                        = "clouddrove-1"
  service_project_id                     = "clouddrove-2"
  enable_private_ip_alloc                = true
  private_ip_alloc_name                  = ["alloc-ip1", "alloc-ip2"]
  prefix_length                          = [16, 24]
  enable_service_networking              = true
}
