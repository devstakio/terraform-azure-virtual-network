output "application_network_profile_id" {
  value = azurerm_network_profile.application.id
}

output "network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "app_subnet_id" {
  value = azurerm_subnet.application.id
}

output "app_subnet_name" {
  value = azurerm_subnet.application.name
}

output "kube_subnet_name" {
  value = azurerm_subnet.kubernetes_cluster.name
}
