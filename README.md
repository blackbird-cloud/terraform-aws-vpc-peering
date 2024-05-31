# AWS VPC peering module
A Terraform module which configures VPC peering between multiple VPCs in different accounts.

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://www.blackbird.cloud)

## Example
```hcl
module "requester" {
  source  = "blackbird-cloud/vpc-peering/aws//modules/vpc-peering-accepter"
  version = "~> 1"

  requester_vpc_id    = "vpc-12345678"
  accepter_vpc_id     = "vpc-87654321"
  accepter_account_id = "123456789012"
  peer_region         = "us-west-2"

  accepter_cidr_block = "10.0.0.0/16"
  route_table_ids     = ["rtb-12345678", "rtb-87654321"]
}

module "accepter" {
  source  = "blackbird-cloud/vpc-peering/aws//modules/vpc-peering-accepter"
  version = "~> 1"

  vpc_connection_id = module.requester.vpc_peering_connection_id

  auto_accept     = false
  route_table_ids = ["rtb-12345678", "rtb-87654321"]
}
```

# AWS VPC peering requester module
A Terraform module which configures VPC peering between multiple VPCs. This submodule creates a requester VPC peering connection. 

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://www.blackbird.cloud)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.52.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route.r](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_caller_identity.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accepter_account_id"></a> [accepter\_account\_id](#input\_accepter\_account\_id) | The AWS account ID of the owner of the accepter VPC. | `string` | `null` | no |
| <a name="input_accepter_cidr_block"></a> [accepter\_cidr\_block](#input\_accepter\_cidr\_block) | The CIDR block of the accepter VPC. | `string` | n/a | yes |
| <a name="input_accepter_vpc_id"></a> [accepter\_vpc\_id](#input\_accepter\_vpc\_id) | The ID of the VPC with which you are creating the VPC peering connection. | `string` | n/a | yes |
| <a name="input_auto_accept"></a> [auto\_accept](#input\_auto\_accept) | Whether the VPC peering connection should be automatically accepted. | `bool` | `false` | no |
| <a name="input_peer_region"></a> [peer\_region](#input\_peer\_region) | The region of the accepter VPC. | `string` | n/a | yes |
| <a name="input_requester_vpc_id"></a> [requester\_vpc\_id](#input\_requester\_vpc\_id) | The ID of the requester VPC. | `string` | n/a | yes |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | The route tables for which to install the internet route to the PCX. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_peering_id"></a> [vpc\_peering\_id](#output\_vpc\_peering\_id) | The ID of the VPC peering connection. |
# AWS VPC peering accepter module
A Terraform module which configures VPC peering between multiple VPCs. This submodule creates an accepter VPC peering connection. 

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://www.blackbird.cloud)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.52.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route.r](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection_accepter.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_accept"></a> [auto\_accept](#input\_auto\_accept) | Whether the VPC peering connection should be automatically accepted. | `bool` | `false` | no |
| <a name="input_requester_cidr_block"></a> [requester\_cidr\_block](#input\_requester\_cidr\_block) | The CIDR block of the requester VPC. | `string` | n/a | yes |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | The route tables for which to install the internet route to the PCX. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_vpc_peering_connection_id"></a> [vpc\_peering\_connection\_id](#input\_vpc\_peering\_connection\_id) | The ID of the VPC peering connection. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC peering connection accepter. |

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2023 [Blackbird Cloud](https://www.blackbird.cloud)