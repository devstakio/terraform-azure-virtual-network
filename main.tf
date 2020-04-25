data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers

  // TODO: research what this is
  //  ddos_protection_plan {
  //    id     = azurerm_network_ddos_protection_plan.example.id
  //    enable = true
  //  }

  tags = data.azurerm_resource_group.resource_group.tags
}

resource "azurerm_subnet" "public" {
  name                 = "public"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = local.public_address_prefix
}

resource "azurerm_subnet" "kubernetes_cluster" {
  name                 = "kubernetes"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = local.kubernetes_address_prefix
  service_endpoints    = ["Microsoft.Sql"]
}