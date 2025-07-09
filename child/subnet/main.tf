resource "azurerm_subnet" "front1" {
    name =var.azurerm_subnet1
    resource_group_name = var.azurerm_resource_group
    virtual_network_name = var.azurerm_virtual_network
    address_prefixes = var.azurerm_address_prefixes1
  
}

resource "azurerm_subnet" "front2" {
    name =var.azurerm_subnet2
    resource_group_name = var.azurerm_resource_group
    virtual_network_name = var.azurerm_virtual_network
    address_prefixes = var.azurerm_address_prefixes2
  
}