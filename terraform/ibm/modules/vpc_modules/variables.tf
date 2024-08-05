
variable "region" {
  type        = string
  default     = "us-south"
}

variable "vpc_name" {
  type        = string
}

variable "zones" {
  type        = string
}

# variable "subnet_cidr_blocks" {
#   type        = list(string)
# }

variable address_prefixes {
    type = map(object({
        name = string
        cidr = string
        zone = number
    }))
}

variable subnets {
    type = map(object({
        name = string
        cidr = string
        zone = number
        pubgw = string  # Should match object name defined in the public_gateways variable
    }))
}

variable public_gateways {
    type = map(object({
        zone = number
    }))
}

variable tags {
    description = "Enter any tags that you want to associate with VPC and associated resources."
    type        = list(string)
    default     = [
      "project:demo",
      "env:test"
    ]
}
# variable "resource_group" {
#   type        = string
#   default     = "default"
# }

# variable "route_table" {
#   type        = string
#   default     = null
# }

# variable "network_acl" {
#   type        = string
#   default     = null
# }
