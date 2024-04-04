
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

