resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name #Virtual Machine
  location              = var.location #Location for my Resource
  resource_group_name = azurerm_resource_group.rg.name #Resource Group for my Infra
  size                  = var.vm_size #VM Size
  admin_username        = var.admin_user_name #Admin User for VM
  network_interface_ids = [azurerm_network_interface.nic1.id] #Connection of VM with NIC

  admin_ssh_key {
    username   = var.admin_user_name #ssh user
    public_key = file(var.ssh_key) #ssh key file
  }

  os_disk {
    caching              = "ReadWrite" #Permissions
    storage_account_type = "Standard_LRS" #Disk Storage
  }

  source_image_reference {
    publisher = "Canonical" #Publiser of the OS
    offer     = "UbuntuServer" #Type of OS
    sku       = "18.04-LTS" #Version of the OS
    version   = "latest" #Image of the OS
  }

  tags = {
    environment = "TerraformDemo"
  }
}

resource "azurerm_linux_virtual_machine" "nvm" {
  name                  = var.nvm_name #New Virtual Machine
  location              = var.location #Location for my Resource
  resource_group_name = azurerm_resource_group.rg.name #Resource Group for my Infra
  size                  = var.vm_size #VM Size
  admin_username        = var.admin_user_name #Admin User for VM
  network_interface_ids = [azurerm_network_interface.nic2.id] #Connection of VM with NIC

  admin_ssh_key {
    username   = var.admin_user_name #ssh user
    public_key = file(var.ssh_key) #ssh key file
  }

  os_disk {
    caching              = "ReadWrite" #Permissions
    storage_account_type = "Standard_LRS" #Disk Storage
  }

  source_image_reference {
    publisher = "Canonical" #Publiser of the OS
    offer     = "UbuntuServer" #Type of OS
    sku       = "18.04-LTS" #Version of the OS
    version   = "latest" #Image of the OS
  }

  tags = {
    environment = "TerraformDemo vm 2"
  }
}