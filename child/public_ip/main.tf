resource "azurerm_public_ip" "pip1" {
    name = var.azurerm_public_ip
    location = var.azurerm_location
    resource_group_name = var.azurerm_resource_group
    allocation_method = "Static"
  
}