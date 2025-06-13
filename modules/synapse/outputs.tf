output "synapse_workspace_name" {
  value = azurerm_synapse_workspace.synapse.name
}

output "synapse_sql_endpoint" {
  value = azurerm_synapse_workspace.synapse.connectivity_endpoints["sql"]
}
output "synapse_identity_principal_id" {
  value = azurerm_synapse_workspace.synapse.identity[0].principal_id
}
output "synapse_workspace_id" {
  value = azurerm_synapse_workspace.synapse.id
}