resource "azurerm_network_interface" "nic1" {
  name                = "${var.vm_name}-nic"            # Network Interface 1
  location            = var.location                    # Region for My Infra
  resource_group_name = azurerm_resource_group.rg.name         # My Resource Group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id    # Connected to Subnet 1
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.nvm_name}-nic"           # Network Interface 2
  location            = var.location                    # Region for My Infra
  resource_group_name = azurerm_resource_group.rg.name        # My Resource Group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.nsubnet.id   # Connected to Subnet 2
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic1_assoc" {
  network_interface_id      = azurerm_network_interface.nic1.id   # NIC1 id
  network_security_group_id = azurerm_network_security_group.nsg.id # NSG id
}

resource "azurerm_network_interface_security_group_association" "nic2_assoc" {
  network_interface_id      = azurerm_network_interface.nic2.id   # NIC2 id
  network_security_group_id = azurerm_network_security_group.nsg.id # NSG id
}