data "aws_caller_identity" "peer" {}

resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  peer_owner_id = try(var.accepter_account_id, data.aws_caller_identity.peer.account_id)
  peer_region   = var.peer_region
  auto_accept   = var.auto_accept
  tags          = var.tags
}

resource "aws_route" "r" {
  for_each = toset(var.route_table_ids)

  route_table_id            = each.key
  destination_cidr_block    = var.accepter_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  depends_on = [aws_vpc_peering_connection.peer]
}
