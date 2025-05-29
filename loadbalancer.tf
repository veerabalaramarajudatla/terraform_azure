resource "azurerm_public_ip" "lb_pip" {
  name                = "my-lb-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "my_lb" {
  name                = "my-loadbalancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "my-lb-fe-ip"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  name            = "my-backend-pool"
  loadbalancer_id = azurerm_lb.my_lb.id
}

resource "azurerm_lb_probe" "http_probe" {
  name               = "http-probe"
  loadbalancer_id    = azurerm_lb.my_lb.id
  protocol           = "Tcp"
  port               = 80
  interval_in_seconds = 5
  number_of_probes   = 2
}

resource "azurerm_lb_rule" "http_rule" {
  name                            = "http-rule"
  loadbalancer_id                 = azurerm_lb.my_lb.id
  protocol                        = "Tcp"
  frontend_port                   = 80
  backend_port                    = 80
  frontend_ip_configuration_name = "my-lb-fe-ip"
  probe_id                       = azurerm_lb_probe.http_probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic1_assoc" {
  network_interface_id    = azurerm_network_interface.nic1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic2_assoc" {
  network_interface_id    = azurerm_network_interface.nic2.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id
}