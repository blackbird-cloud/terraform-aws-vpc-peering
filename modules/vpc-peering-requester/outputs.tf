output "vpc_peering_id" {
  description = "The ID of the VPC peering connection."
  value       = aws_vpc_peering_connection.peer.id
}
