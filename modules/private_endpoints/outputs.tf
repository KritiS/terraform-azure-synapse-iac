output "sql_private_endpoint_id" {
  value = azurerm_private_endpoint.sql_pe.id
}

output "synapse_private_endpoint_id" {
  value = azurerm_private_endpoint.synapse_pe.id
}

output "storage_private_endpoint_id" {
  value = azurerm_private_endpoint.storage_pe.id
}

output "keyvault_private_endpoint_id" {
  value = azurerm_private_endpoint.keyvault_pe.id
}