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