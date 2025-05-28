output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.rvn.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.rvn.address_space
}

output "subnet_id" {
  value = azurerm_subnet.rsubnet.id
}