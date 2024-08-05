
resource "ibm_resource_group" "resourceGroup" {
  name     = "test"
}

resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
  tags = var.tags
  resource_group = ibm_resource_group.resourceGroup.id
}



resource "ibm_is_vpc_address_prefix" "vpc_address_prefix" {
   for_each = var.address_prefixes
   name  = each.value["name"]
   zone  = format("%s-%s", var.region, each.value["zone"])
   cidr  = each.value["cidr"]
   vpc   = ibm_is_vpc.vpc.id
}

resource "ibm_is_subnet" "subnet" {
  for_each = var.subnets
  name             = each.value["name"]
  vpc              = ibm_is_vpc.vpc.id
  zone            = format("%s-%s", var.region, each.value["zone"])
  ipv4_cidr_block = each.value["cidr"]
  public_gateway  = each.value["pubgw"] != ""  ? lookup(ibm_is_public_gateway.public_gateway, each.value["pubgw"] ).id : null
  resource_group = ibm_resource_group.resourceGroup.id
  #resource_group   = var.resource_group
  #routing_table   = ibm_is_vpc_routing_table.route_table.routing_table
  #network_acl      = var.network_acl
  depends_on = [ ibm_is_vpc_address_prefix.vpc_address_prefix ]
}

resource ibm_is_public_gateway public_gateway {
   for_each = var.public_gateways
   name  = format("%s-publicgw-%s", var.vpc_name, each.value["zone"])
   vpc   = ibm_is_vpc.vpc.id
   resource_group = ibm_resource_group.resourceGroup.id
   zone  = format("%s-%s", var.region, each.value["zone"])
   tags = var.tags
}