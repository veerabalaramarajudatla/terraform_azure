resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vm_name}-nsg" #Network Security Group
  location            = var.location #Location for my Resource
  resource_group_name = azurerm_resource_group.rg.name #Resource Group for my Infra

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow" #Allow or deny
    protocol                   = "Tcp" #TCP or UDP
    source_port_range          = "*"
    destination_port_range     = "22" #Port Number
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}