

module "ibm_vpc" {
  source               = "../modules/vpc_modules"
  region               = "us-south"
  vpc_name             = "iks-vpc"
  zones                = "us-south-1"
  subnet_cidr_blocks   = ["10.0.0.0/23", "10.0.4.0/23", "10.0.8.0/23"]
  #public_gateway       = true
  #resource_group       = "default"
}

output "vpc_id" {
  value = module.ibm_vpc.vpc_id
}

output "subnet_ids" {
  value = module.ibm_vpc.subnet_ids
}