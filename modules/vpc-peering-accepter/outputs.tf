output "id" {
  description = "The ID of the VPC peering connection accepter."
  value       = aws_vpc_peering_connection_accepter.peer.id
}

output "vpc_id" {
  description = "The ID of the accepting VPC"
  value       = aws_vpc_peering_connection_accepter.peer.vpc_id
}

output "peer_vpc_id" {
  description = "The ID of the requesting VPC"
  value       = aws_vpc_peering_connection_accepter.peer.peer_vpc_id
}
