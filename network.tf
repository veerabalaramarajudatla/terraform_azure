resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name #Resource Group for my Infra
  location = var.location #Location for my Resource
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name #Virtual Network Name
  address_space       = [var.vnet_address_space] #Address for the Virtual Network
  location            = var.location #Location for my Resource
  resource_group_name = azurerm_resource_group.rg.name #Resource Group for my Infra
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}