resource "azurerm_virtual_network" "vnet" {
  count = length(var.virtual_network_names)  
  name                = var.virtual_network_names[count.index]
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space[count.index]]

}

resource "azurerm_subnet" "example" {
  count = length(var.subnet_names)  
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_virtual_network.vnet[count.index].resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[count.index].name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}