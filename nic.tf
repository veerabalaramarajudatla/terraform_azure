resource "azurerm_network_interface" "nic1" {
  name                = "${var.vm_name}-nic" #NIC 1
  location            = var.location #Location for my Resource
  resource_group_name = azurerm_resource_group.rg.name #Resource Group for my Infra

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id #Subnet we had created previous
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.nvm_name}-nic" #NIC 2
  location            = var.location #Location for my Resource
  resource_group_name = azurerm_resource_group.rg.name #Resource Group for my Infra

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id  #Subnet we had created previous
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic1_assoc" {
  network_interface_id      = azurerm_network_interface.nic1.id #Connection between NIC 1 and NSG
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_interface_security_group_association" "nic2_assoc" {
  network_interface_id      = azurerm_network_interface.nic2.id #Connection between NIC 1 and NSG
  network_security_group_id = azurerm_network_security_group.nsg.id
}