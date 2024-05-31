variable "requester_vpc_id" {
  description = "The ID of the requester VPC."
  type        = string
}

variable "accepter_vpc_id" {
  description = "The ID of the VPC with which you are creating the VPC peering connection."
  type        = string
}

variable "peer_region" {
  description = "The region of the accepter VPC."
  type        = string
}

variable "accepter_account_id" {
  description = "The AWS account ID of the owner of the accepter VPC."
  type        = string
  default     = null
}

variable "auto_accept" {
  description = "Whether the VPC peering connection should be automatically accepted."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "route_table_ids" {
  type        = list(string)
  description = "The route tables for which to install the internet route to the PCX."
}

variable "accepter_cidr_block" {
  description = "The CIDR block of the accepter VPC."
  type        = string
}
