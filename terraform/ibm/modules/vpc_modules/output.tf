output "vpc_id" {
  description = "The ID of the VPC"
  value       = ibm_is_vpc.vpc.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [for subnet in ibm_is_subnet.subnet : subnet.id]
}

# output "subnet_cidr_blocks" {
#   description = "The CIDR blocks of the subnets"
#   value       = [for subnet in ibm_is_subnet.subnet : subnet.cidr]
# }
