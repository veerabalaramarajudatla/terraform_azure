output "load_balancer_public_ip" {
  description = "The public IP address of the load balancer"
  value       = azurerm_public_ip.lb_pip.ip_address
}

output "vm_id" {
  description = "The ID of the first virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "nvm_id" {
  description = "The ID of the second virtual machine"
  value       = azurerm_linux_virtual_machine.nvm.id
}

output "vm_private_ip" {
  description = "The private IP address of the first VM"
  value       = azurerm_network_interface.nic1.private_ip_address
}

output "nvm_private_ip" {
  description = "The private IP address of the second VM"
  value       = azurerm_network_interface.nic2.private_ip_address
}

output "load_balancer_backend_pool_id" {
  description = "The ID of the load balancer backend address pool"
  value       = azurerm_lb_backend_address_pool.lb_backend.id
}

output "load_balancer_frontend_config" {
  description = "The name of the frontend IP configuration of the load balancer"
  value       = azurerm_lb.my_lb.frontend_ip_configuration[0].name
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}