terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
 }

module "resoruceGroup" {
  source = "./module/resource-group"
  resource_group_name = var.resource_group_name
  location = var.location
}
module "virtualNetwork" {
source = "./module/virtual-network"
virtual_network_names = var.virtual_network_names
address_space= var.address_space
subnet_names = var.subnet_names
subnet_prefixes = var.subnet_prefixes
resource_group_name = module.resoruceGroup.resource_group_name
location=var.location
}