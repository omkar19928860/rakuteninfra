data "azurerm_public_ip" "pip1" {
    name                = "pip1f"
    resource_group_name = "omkar-rg1"
  
}

data "azurerm_subnet" "subnet1" {
  

    name                 = "omkarsubnetfront"
    resource_group_name  = "omkar-rg1"
    virtual_network_name = "omkarvnet1"
  
}


data "azurerm_subnet" "subnet2" {
    name                 = "omkarsubnetback"
    resource_group_name  = "omkar-rg1"
    virtual_network_name = "omkarvnet1"
  
}

data "azurerm_key_vault" "vault" {
    name                = "omkarvault"
    resource_group_name = "omkar-rg1"
  
}


 
data "azurerm_key_vault_secret" "user" {
    name         = "admin-user"
    key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "password" {
    name         = "admin-password"
    key_vault_id = data.azurerm_key_vault.vault.id
}