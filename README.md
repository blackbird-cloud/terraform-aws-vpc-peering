<!-- BEGIN_TF_DOCS -->
# Terraform Aws Vpc Peering Module
A Terraform module which configures VPC peering between multiple VPCs in different accounts.

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

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

  vpc_peering_connection_id = module.requester.id

  auto_accept     = false
  route_table_ids = ["rtb-12345678", "rtb-87654321"]

  requester_cidr_block = "20.0.0.0/16"
}
```

## Modules

- [Vpc Peering Requester](./modules/vpc-peering-requester/README.md)
- [Vpc Peering Accepter](./modules/vpc-peering-accepter/README.md)

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2024 [Blackbird Cloud](https://blackbird.cloud)
<!-- END_TF_DOCS -->