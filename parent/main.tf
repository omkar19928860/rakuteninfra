module "rg-omkar" {
  source = "../child/Resource_group"

  azurerm_resource_group = "omkar-rg1"
  azurerm_location       = "eastus"

}

module "vnet1" {
  source                  = "../child/vnet"
  azurerm_virtual_network = "omkarvnet1"
  azurerm_resource_group  = "omkar-rg1"
  azurerm_address_space   = ["10.0.0.0/16"]
  azurerm_location        = "eastus"
  depends_on              = [module.rg-omkar]

}

module "azurerm_subnetfront" {
  source                    = "../child/subnet"
  azurerm_resource_group    = "omkar-rg1"
  azurerm_location          = "eastus"
  azurerm_virtual_network   = "omkarvnet1"
  azurerm_address_prefixes1 = ["10.0.2.0/24"]
  azurerm_address_prefixes2 = ["10.0.4.0/24"]
  azurerm_subnet1           = "omkarsubnetfront"
  azurerm_subnet2           = "omkarsubnetback"
  depends_on                = [module.vnet1, module.rg-omkar]

}



module "pip1front" {
  source                 = "../child/public_ip"
  azurerm_public_ip      = "pip1f"
  azurerm_resource_group = "omkar-rg1"
  azurerm_location       = "eastus"
  depends_on             = [module.rg-omkar]

}

module "vimfront" {
  source                 = "../child/virtual_machine"
  name                   = "omkar-vm1f"
  name2                  = "omkar-vm1b"
  name3                  = "omkar-vm2f"
  name4                  = "omkar-vm2b"
  azurerm_resource_group = "omkar-rg1"
  azurerm_location       = "eastus"
  azurerm_virtual-size   = "Standard_B1s"
  nic1front              = "omkar-nic1f"
  nic1back               = "omkar-nic1b"
  depends_on             = [module.azurerm_subnetfront, module.pip1front, module.rg-omkar]
  nic3front              = "omkar-nic3f"
  nic4back               = "omkar-nic4b"

}

module "sqldb" {
  source = "../child/sql_database"

}












