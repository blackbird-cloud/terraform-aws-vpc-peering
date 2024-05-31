variable "vpc_peering_connection_id" {
  description = "The ID of the VPC peering connection."
  type        = string
}

variable "auto_accept" {
  description = "Whether the VPC peering connection should be automatically accepted."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "route_table_ids" {
  type        = list(string)
  description = "The route tables for which to install the internet route to the PCX."
}

variable "requester_cidr_block" {
  description = "The CIDR block of the requester VPC."
  type        = string
}
