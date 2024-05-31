resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = var.vpc_peering_connection_id
  auto_accept               = var.auto_accept
  tags                      = var.tags
}

resource "aws_route" "r" {
  for_each = toset(var.route_table_ids)

  route_table_id            = each.key
  destination_cidr_block    = var.requester_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id

  depends_on = [aws_vpc_peering_connection_accepter.peer]
}
