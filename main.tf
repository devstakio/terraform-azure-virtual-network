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

resource "azurerm_subnet" "application" {
  name                 = "application"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = local.application_address_prefix
  service_endpoints    = ["Microsoft.Sql"]


  delegation {
    name = "container-delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

resource "azurerm_subnet" "kubernetes_cluster" {
  name                 = "kubernetes"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = local.kubernetes_address_prefix
  service_endpoints    = ["Microsoft.Sql"]
}

// Used to allow a container in the container group have a private IP address
resource "azurerm_network_profile" "application" {
  name                = "application"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  container_network_interface {
    name = "application-nic"

    ip_configuration {
      name      = "application-ip-config"
      subnet_id = azurerm_subnet.application.id
    }
  }
}