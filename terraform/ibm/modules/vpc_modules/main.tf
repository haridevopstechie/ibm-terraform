resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}


resource "ibm_is_vpc_routing_table" "route_table" {
  name = "${var.vpc_name}-routing-table"
  vpc  =  ibm_is_vpc.vpc.id
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefix" {
  cidr = "10.0.0.0/20"
  name = "${var.vpc_name}-add-prefix"
  vpc  = ibm_is_vpc.vpc.id
  zone = "us-south-1"
}

resource "ibm_is_subnet" "subnet" {
  count            = length(var.subnet_cidr_blocks)
  name             = "${var.vpc_name}-subnet-${count.index + 1}"
  vpc              = ibm_is_vpc.vpc.id
  zone             = var.zones
  ipv4_cidr_block  = element(var.subnet_cidr_blocks, count.index)
  #public_gateway   = var.public_gateway
  #resource_group   = var.resource_group
  routing_table   = ibm_is_vpc_routing_table.route_table.routing_table
  #network_acl      = var.network_acl
  depends_on = [ ibm_is_vpc_address_prefix.vpc_address_prefix ]
}