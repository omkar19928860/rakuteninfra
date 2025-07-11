terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
  backend "azurerm" {
  resource_group_name  = "omkarrg"
  storage_account_name = "omkarst"
  container_name       = "omkarstc"
  key                  = "terraform.tfstate"
}
}



provider "azurerm" {
  features {}
  subscription_id = "289da116-5358-4835-8897-9e1db2cde3d2"
}

 