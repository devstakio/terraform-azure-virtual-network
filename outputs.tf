output "network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "kubernetes_subnet_name" {
  value = azurerm_subnet.kubernetes_cluster.name
}

output "kubernetes_subnet_id" {
  value = azurerm_subnet.kubernetes_cluster.id
}
