# ------------------------------------------------------------------------------
# Versions
# ------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.7.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.0.0"
    }
  }
}