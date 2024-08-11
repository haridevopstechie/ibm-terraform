

module "ibm_vpc" {
  source   = "../modules/vpc_modules"
  region   = "us-south"
  vpc_name = "iks-vpc"
  zones    = "us-south-1"
  address_prefixes = {
    prefix-1 = { name = "address-prefix-1", cidr = "10.245.0.0/18", zone = "1" },
    prefix-2 = { name = "address-prefix-2", cidr = "10.245.64.0/18", zone = "2" },
    prefix-3 = { name = "address-prefix-3", cidr = "10.245.128.0/18", zone = "3" }
  }
  subnets = {
    subnet-1a = { name = "subnet-bastion", cidr = "10.245.0.0/24", zone = "1", pubgw = "publicgw-1" },
    subnet-1b = { name = "subnet-1", cidr = "10.245.1.0/24", zone = "1", pubgw = "" },
    subnet-2  = { name = "subnet-2", cidr = "10.245.64.0/24", zone = "2", pubgw = "" },
    subnet-3  = { name = "subnet-3", cidr = "10.245.128.0/24", zone = "3", pubgw = "" }
  }
  public_gateways = {
    publicgw-1 = { zone = "1" }
  }
  #resource_group       = "default"
}

output "vpc_id" {
  value = module.ibm_vpc.vpc_id
}

output "subnet_ids" {
  value = module.ibm_vpc.subnet_ids
}