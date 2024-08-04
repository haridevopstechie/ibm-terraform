terraform {
  required_providers {
    ibm = {
      source = "ibm-cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  region = "us-south"
  ibmcloud_api_key = "xH2kdCq4wQhTbdh_KLRUhApMqVX72tpNlmiVEPvA2lwA"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    endpoint = "s3.us-south.cloud-object-storage.appdomain.cloud"
    region = "us-standard"
    key    = "vpc/terraform.tfstate"
    access_key = "32fc41dc30a446c2aa90ea979ed6ab95"
    secret_key = "164bbd0e7d438ab7521e7b94f3643b0ddef58b85688ae5f3"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

# # terraform plan