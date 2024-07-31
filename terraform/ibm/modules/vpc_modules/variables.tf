
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

variable "subnet_cidr_blocks" {
  type        = list(string)
}

# variable "public_gateway" {
#   type        = bool
#   default     = false
# }

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
