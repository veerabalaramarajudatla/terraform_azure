resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name #Virtual Machine 1
  location              = var.location #Region for my Infra
  resource_group_name   = var.resource_group_name #My Resource Group
  size                  = var.vm_size #VM Size
  admin_username        = var.admin_user_name #VM User
  network_interface_ids = [azurerm_network_interface.nic1.id] #Attached with Network Interface Card 1

  admin_ssh_key {
    username   = var.admin_user_name #ssh User
    public_key = file(var.ssh_key) #ssh Key
  }

  os_disk {
    caching              = "ReadWrite" #Permissions
    storage_account_type = "Standard_LRS" #Disk
  }

  source_image_reference {
    publisher = "Canonical" #Publisher of OS
    offer     = "UbuntuServer" #OS type
    sku       = "18.04-LTS" #OS Version
    version   = "latest" #Image
  }

  tags = {
    environment = "TerraformDemo"
  }
}

resource "azurerm_linux_virtual_machine" "nvm" {
  name                  = var.nvm_name #Virtual Machine 2
  location              = var.location #Region for my Infra
  resource_group_name   = var.resource_group_name #My Resource Group
  size                  = var.vm_size #VM Size
  admin_username        = var.admin_user_name #VM User
  network_interface_ids = [azurerm_network_interface.nic2.id] #Attached with Network Interface Card 2

  admin_ssh_key {
    username   = var.admin_user_name #ssh User
    public_key = file(var.ssh_key) #ssh Key
  }

  os_disk {
    caching              = "ReadWrite" #Permissions
    storage_account_type = "Standard_LRS" #Disk
  }

  source_image_reference {
    publisher = "Canonical" #Publisher of OS
    offer     = "UbuntuServer" #OS type
    sku       = "18.04-LTS" #OS Version
    version   = "latest" #Image
  }

  tags = {
    environment = "TerraformDemo vm 2"
  }
}