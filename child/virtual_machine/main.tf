resource "azurerm_linux_virtual_machine" "vmfrontend" {
    name = var.name
    resource_group_name = var.azurerm_resource_group
    location = var.azurerm_location
    size = var.azurerm_virtual-size
    admin_username = data.azurerm_key_vault_secret.user.value
    admin_password = data.azurerm_key_vault_secret.password.value
    network_interface_ids = [azurerm_network_interface.nic1front.id]
    disable_password_authentication = false


    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
    
}
resource "azurerm_network_interface" "nic1front" {
    name = var.nic1front
    location = var.azurerm_location
    resource_group_name = var.azurerm_resource_group

    ip_configuration {
        name                          = "internal"
        subnet_id                     = data.azurerm_subnet.subnet1.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = data.azurerm_public_ip.pip1.id
       
    }
  
}



resource "azurerm_linux_virtual_machine" "vmbackend" {
    name = var.name2
    resource_group_name = var.azurerm_resource_group
    location = var.azurerm_location
    size = var.azurerm_virtual-size
    admin_username = data.azurerm_key_vault_secret.user.value
    admin_password = data.azurerm_key_vault_secret.password.value
    network_interface_ids = [azurerm_network_interface.nic1back.id]
    disable_password_authentication = false


    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
    
}
resource "azurerm_network_interface" "nic1back" {
    name = var.nic1back
    location = var.azurerm_location
    resource_group_name = var.azurerm_resource_group

    ip_configuration {
        name                          = "internal"
        subnet_id                     = data.azurerm_subnet.subnet2.id
        private_ip_address_allocation = "Dynamic"
        
    }
  
}

#

resource "azurerm_linux_virtual_machine" "vmfrontend2" {
    name = var.name3
    resource_group_name = var.azurerm_resource_group
    location = var.azurerm_location
    size = var.azurerm_virtual-size
    admin_username = data.azurerm_key_vault_secret.user.value
    admin_password = data.azurerm_key_vault_secret.password.value
    network_interface_ids = [azurerm_network_interface.nic3front.id]
    disable_password_authentication = false


    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
    
}
resource "azurerm_network_interface" "nic3front" {
    name = var.nic3front
    location = var.azurerm_location
    resource_group_name = var.azurerm_resource_group

    ip_configuration {
        name                          = "internal"
        subnet_id                     = data.azurerm_subnet.subnet1.id
        private_ip_address_allocation = "Dynamic"
        
       
    }
  
}



resource "azurerm_linux_virtual_machine" "vmbackend2" {
    name = var.name4
    resource_group_name = var.azurerm_resource_group
    location = var.azurerm_location
    size = var.azurerm_virtual-size
    admin_username = data.azurerm_key_vault_secret.user.value
    admin_password = data.azurerm_key_vault_secret.password.value
    network_interface_ids = [azurerm_network_interface.nic1back2.id]
    disable_password_authentication = false


    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
    
}
resource "azurerm_network_interface" "nic1back2" {
    name = var.nic4back
    location = var.azurerm_location
    resource_group_name = var.azurerm_resource_group

    ip_configuration {
        name                          = "internal"
        subnet_id                     = data.azurerm_subnet.subnet2.id
        private_ip_address_allocation = "Dynamic"
        
    }
  
}