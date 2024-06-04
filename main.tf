
#-------------------------------------------------------------------------------
# Module "labels" Configuration #
#-------------------------------------------------------------------------------

module "labels" {
  source  = "clouddrove/labels/gcp"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  label_order = var.label_order
}

#------------------------------------------------------------------------------------------
# Google_Compute_Network_(VPC)_Configuration #
#-------------------------------------------------------------------------------------------

resource "google_compute_network" "vpc" {
  count = var.google_compute_network_enabled && var.module_enabled ? 1 : 0

  name        = module.labels.id
  description = var.description
  project     = var.project_id

  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
  enable_ula_internal_ipv6        = var.enable_ula_internal_ipv6
  internal_ipv6_range             = var.internal_ipv6_range

  depends_on = [var.module_depends_on]
}

#-------------------------------------------------------------------------------
# shared_vpc_Configuration  #
#-------------------------------------------------------------------------------

resource "google_compute_shared_vpc_host_project" "host" {
  count   = var.google_compute_shared_vpc_host_enabled && var.enabled ? 1 : 0
  project = var.host_project_id
}

resource "google_compute_shared_vpc_service_project" "service1" {
  count           = var.google_compute_shared_vpc_host_enabled && var.enabled ? 1 : 0
  host_project    = google_compute_shared_vpc_host_project.host[count.index].project
  service_project = var.service_project_id
}

#-------------------------------------------------------------------------------
# Private_IP_Configuration  #
#-------------------------------------------------------------------------------

resource "google_compute_global_address" "private_ip_alloc" {
  count         = length(var.private_ip_alloc_name)
  name          = var.private_ip_alloc_name[count.index]
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.prefix_length[count.index]
  network       = google_compute_network.vpc[0].self_link
}

#-------------------------------------------------------------------------------
# Private_connection_service_Configuration  #
#-------------------------------------------------------------------------------

resource "google_service_networking_connection" "default" {
  count                   = var.enable_service_networking ? 1 : 0
  network                 = google_compute_network.vpc[0].self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = var.enable_service_networking ? [google_compute_global_address.private_ip_alloc[0].name] : []
}

