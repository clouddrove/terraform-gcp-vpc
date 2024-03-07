#-------------------------------------------------------------------------------
# Google_Provider_variables #
#-------------------------------------------------------------------------------

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "gcp_credentials" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Google Cloud service account credentials"
}

variable "gcp_project_id" {
  type        = string
  default     = "clouddrove"
  description = "Google Cloud project ID"
}

variable "gcp_region" {
  type        = string
  default     = "europe-west3"
  description = "Google Cloud region"
}

variable "gcp_zone" {
  type        = string
  default     = "Europe-west3-c"
  description = "Google Cloud zone"
}


