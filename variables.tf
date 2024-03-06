#-------------------------------------------------------------------------------------
               # Module_labels_variable #
#-------------------------------------------------------------------------------------
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

variable "project_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression \"[a-z]([-a-z0-9]*[a-z0-9])?\" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is \"main\"."

}

#---------------------------------------------------------------------------------------------------
                # Google_Compute_Network_(VPC)_variable #
#---------------------------------------------------------------------------------------------------

variable "google_compute_network_enabled" {
  type    = bool
  default = true
}

variable "description" {
  type        = string
  default     = ""
  description = "(Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''."

}

variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "(Optional) The network-wide routing mode to use. If set to 'REGIONAL', this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to 'GLOBAL', this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are 'REGIONAL' and 'GLOBAL'. Default is 'REGIONAL'."
}

variable "delete_default_routes_on_create" {
  type        = bool
  default     = false
  description = "(Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted."

}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
  description = "(Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the '10.128.0.0/9' address range. When set to 'false', the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. Default is 'false'."

}

variable "mtu" {
  type        = string
  default     = 1460
  description = "(Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'."

}

variable "enable_ula_internal_ipv6" {
  type        = bool
  default     = false
  description = "(Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20."

}

variable "internal_ipv6_range" {
  type        = string
  default     = null
  description = "(Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field."

}

variable "module_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether to create resources within the module or not. Default is 'true'."

}

variable "module_depends_on" {
  type        = any
  default     = []
  description = "(Optional) A list of external resources the module depends_on. Default is '[]'."

}

#---------------------------------------------------------------------------------------------------------
                        # shared_vpc_variable #
#----------------------------------------------------------------------------------------------------------

variable "host_project_id" {
  description = "Google Cloud Project ID"
}

variable "service_project_id" {
  description = "Project ID of the service project"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "google_compute_shared_vpc_host_enabled" {
  type        = bool
  default     = true
  description = "Set to false to disable the creation of Google Compute Engine shared VPC host project."
}


