resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name #Resource Group for this terraform infra deployment
  location = var.location #Region for my Infra Setup
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name #Virtual Network 1 for the VM 1
  address_space       = [var.vnet_address_space] #IP Address for the Virtual Network 1
  location            = var.location #Region for my Infra Setup
  resource_group_name = var.resource_group_name #My Resource Group
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name #Subnet 1 for my Virtual Network 1
  resource_group_name  = var.resource_group_name #My Resource Group
  virtual_network_name = azurerm_virtual_network.vnet.name #Virtual Network 1
  address_prefixes     = var.subnet_address_prefix #IP Address for my Subnet 1 (VM - 1)
}

resource "azurerm_virtual_network" "nvnet" {
  name                = var.nvnet_name #Virtual Network 2 for the VM 2
  address_space       = [var.nvnet_address_space] #IP Address for the Virtual Network 2
  location            = var.location #Region for my Infra Setup
  resource_group_name = var.resource_group_name #My Resource Group
}

resource "azurerm_subnet" "nsubnet" {
  name                 = var.nsubnet_name #Subnet 1 for my virtual Network 2 
  resource_group_name  = var.resource_group_name #My Resource Group
  virtual_network_name = azurerm_virtual_network.nvnet.name #Vitual Network 2
  address_prefixes     = var.nsubnet_address_prefix #IP Address for the Subnet 1 (VM - 2)
}

resource "azurerm_virtual_network_peering" "vnet1-to-vnet2" {
  name                      = "vnet1-to-vnet2"
  resource_group_name       = var.resource_group_name #My Resource Group Name
  virtual_network_name      = azurerm_virtual_network.vnet.name #Virtual Network 1
  remote_virtual_network_id = azurerm_virtual_network.nvnet.id #Virtual Network 2 as a remote
  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet2-to-vnet1" {
  name                      = "vnet2-to-vnet1"
  resource_group_name       = var.resource_group_name #My Resource Group Name
  virtual_network_name      = azurerm_virtual_network.nvnet.name #Virtual Network 2
  remote_virtual_network_id = azurerm_virtual_network.vnet.id #Virtual Network 1 as remote
  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
}