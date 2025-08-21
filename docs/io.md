## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | (Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the '10.128.0.0/9' address range. When set to 'false', the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. Default is 'false'. | `bool` | `false` | no |
| delete\_default\_routes\_on\_create | (Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted. | `bool` | `false` | no |
| description | (Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''. | `string` | `""` | no |
| enable\_private\_ip\_alloc | Enable allocation of a private IP address range for VPC peering. | `bool` | `true` | no |
| enable\_service\_networking | Whether to enable service networking | `bool` | `true` | no |
| enable\_ula\_internal\_ipv6 | (Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20. | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment name | `string` | `"dev"` | no |
| google\_compute\_network\_enabled | Specifies whether the Google Compute Engine network should be enabled | `bool` | `true` | no |
| google\_compute\_shared\_vpc\_host\_enabled | Set to false to disable the creation of Google Compute Engine shared VPC host project. | `bool` | `true` | no |
| host\_project\_id | Google Cloud Project ID | `string` | `""` | no |
| internal\_ipv6\_range | (Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field. | `string` | `null` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| module\_depends\_on | (Optional) A list of external resources the module depends\_on. Default is '[]'. | `any` | `[]` | no |
| module\_enabled | (Optional) Whether to create resources within the module or not. Default is 'true'. | `bool` | `true` | no |
| mtu | (Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'. | `string` | `1460` | no |
| name | (Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression "[a-z]([-a-z0-9]\*[a-z0-9])?" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is "main". | `string` | `""` | no |
| prefix\_length | List of prefix lengths for the private IP allocations | `list(number)` | n/a | yes |
| private\_ip\_alloc\_name | List of names for the private IP allocations | `list(string)` | n/a | yes |
| project\_id | (Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used. | `string` | `""` | no |
| routing\_mode | (Optional) The network-wide routing mode to use. If set to 'REGIONAL', this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to 'GLOBAL', this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are 'REGIONAL' and 'GLOBAL'. Default is 'REGIONAL'. | `string` | `"REGIONAL"` | no |
| service\_project\_id | Project ID of the service project | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| host\_project\_id | The ID of the Google Cloud project acting as the host project for the Shared VPC. |
| service\_project\_id | The ID of the Google Cloud project acting as the service project for the Shared VPC. |
| vpc\_id | The outputs of the created VPC. |
