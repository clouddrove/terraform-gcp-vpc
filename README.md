<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform gcp vpc
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create VPC resource on google.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-vpc/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-vpc/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-vpc/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-vpc/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-gcp-vpc'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+gcp+vpc&url=https://github.com/clouddrove/terraform-gcp-vpc'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+gcp+vpc&url=https://github.com/clouddrove/terraform-gcp-vpc'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-gcp-vpc/releases).


Here are some examples of how you can use this module in your inventory structure:
### Default vpc
```hcl
module "vpc" {
 source = "../"

 name        = "vpc"
 environment = var.environment
 label_order = var.label_order

 google_compute_network_enabled  = true
 project_id                      = "clouddrove"
 auto_create_subnetworks         = true
 routing_mode                    = "REGIONAL"
 mtu                             = 1460
 delete_default_routes_on_create = true
 enable_ula_internal_ipv6        = false
}
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | (Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the '10.128.0.0/9' address range. When set to 'false', the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. Default is 'false'. | `bool` | `false` | no |
| delete\_default\_routes\_on\_create | (Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted. | `bool` | `false` | no |
| description | (Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''. | `string` | `""` | no |
| enable\_ula\_internal\_ipv6 | (Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20. | `bool` | `false` | no |
| environment | Environment name | `string` | `"dev"` | no |
| google\_compute\_network\_enabled | n/a | `bool` | `true` | no |
| internal\_ipv6\_range | (Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field. | `string` | `null` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| module\_depends\_on | (Optional) A list of external resources the module depends\_on. Default is '[]'. | `any` | `[]` | no |
| module\_enabled | (Optional) Whether to create resources within the module or not. Default is 'true'. | `bool` | `true` | no |
| mtu | (Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'. | `string` | `1460` | no |
| name | (Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression "[a-z]([-a-z0-9]\*[a-z0-9])?" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is "main". | `string` | `""` | no |
| project\_id | (Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used. | `string` | `null` | no |
| routing\_mode | (Optional) The network-wide routing mode to use. If set to 'REGIONAL', this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to 'GLOBAL', this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are 'REGIONAL' and 'GLOBAL'. Default is 'REGIONAL'. | `string` | `"REGIONAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The outputs of the created VPC. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-gcp-vpc/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-gcp-vpc)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=