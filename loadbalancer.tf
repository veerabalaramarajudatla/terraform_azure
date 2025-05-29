resource "azurerm_public_ip" "lb_pip" {
  name                = "my-lb-pip"                   # Public IP
  location            = var.location                   # Region for My Infra
  resource_group_name = var.resource_group_name        # My Resource Group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "my_lb" {
  name                = "my-loadbalancer"             # Load Balancer Name
  location            = var.location                   # Region for My Infra
  resource_group_name = var.resource_group_name        # My Resource Group
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "my-lb-fe-ip"               # Frontend IP Config Name
    public_ip_address_id = azurerm_public_ip.lb_pip.id # Reference to Public IP
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  name                = "my-backend-pool"             # Backend Pool Name
  loadbalancer_id     = azurerm_lb.my_lb.id            # Reference to Load Balancer
  resource_group_name = var.resource_group_name        # My Resource Group
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "http-probe"                  # Health Probe Name
  resource_group_name = var.resource_group_name        # My Resource Group
  loadbalancer_id     = azurerm_lb.my_lb.id            # Reference to Load Balancer
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http_rule" {
  name                            = "http-rule"                  # Rule Name
  resource_group_name             = var.resource_group_name       # My Resource Group
  loadbalancer_id                 = azurerm_lb.my_lb.id           # Reference to Load Balancer
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "my-lb-fe-ip"                # Frontend IP Config
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb_backend.id
  probe_id                       = azurerm_lb_probe.http_probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic1_assoc" {
  network_interface_id    = azurerm_network_interface.nic1.id    # NIC 1 ID
  ip_configuration_name   = "internal"                            # NIC IP Configuration Name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id # Backend Pool ID
}

resource "azurerm_network_interface_backend_address_pool_association" "nic2_assoc" {
  network_interface_id    = azurerm_network_interface.nic2.id    # NIC 2 ID
  ip_configuration_name   = "internal"                            # NIC IP Configuration Name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id # Backend Pool ID
}