output "vnet_id" {
  value = azurerm_virtual_network.main.id
}
output "synapse_subnet_id" {
  value = azurerm_subnet.synapse.id
}
output "private_endpoints_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}
output "vnet_name" {
  value = azurerm_virtual_network.main.name
}
output "synapse_nsg_id" {
  value = azurerm_network_security_group.synapse_nsg.id
}
output "private_endpoints_nsg_id" {
  value = azurerm_network_security_group.private_endpoints_nsg.id
}