resource "azurerm_virtual_network" "frontvnet" {
    name = var.azurerm_virtual_network
    resource_group_name = var.azurerm_resource_group
    address_space =var.azurerm_address_space
    location = var.azurerm_location
 
}


 