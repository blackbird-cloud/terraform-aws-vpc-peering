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
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5 |

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
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vpc_peering_connection_id"></a> [vpc\_peering\_connection\_id](#input\_vpc\_peering\_connection\_id) | The ID of the VPC peering connection. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC peering connection accepter. |
| <a name="output_peer_vpc_id"></a> [peer\_vpc\_id](#output\_peer\_vpc\_id) | The ID of the requesting VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the accepting VPC |
