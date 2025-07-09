resource "azurerm_resource_group" "rg6" {
    name     = "omkar-rg2"
    location = "centralindia"
  
}




resource "azurerm_mssql_server" "server" {
  name                         = "omsqlserver"
  resource_group_name          = "omkar-rg2"
  location                     = "centralindia"
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "admin@12345"
}

resource "azurerm_mssql_database" "sev" {
  name         = "omsqldb"
  server_id    = azurerm_mssql_server.server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }
}