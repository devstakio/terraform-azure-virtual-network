output "application_network_profile_id" {
  value = azurerm_network_profile.application.id
}

output "app_subnet_id" {
  value = azurerm_subnet.application.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}