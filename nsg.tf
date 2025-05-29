resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vm_name}-nsg"          # Network Security Group Name
  location            = var.location                   # Region for our infra
  resource_group_name = azurerm_resource_group.rg.name       # My Resource Group

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"              # Inbound or Outbound
    access                     = "Allow"                # Allow or deny
    protocol                   = "Tcp"                  # TCP or UDP
    source_port_range          = "*"
    destination_port_range     = "22"                   # Port Number for SSH
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}