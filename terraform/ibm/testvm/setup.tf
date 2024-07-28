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




# export IC_API_KEY="xH2kdCq4wQhTbdh_KLRUhApMqVX72tpNlmiVEPvA2lwA"
# export IAAS_CLASSIC_USERNAME="terraform_test"
# export IAAS_CLASSIC_API_KEY="38e1aba5dd1769091d9a76101a85990adead36386cc0d4bf5a2871ae05c92249"
# # terraform plan