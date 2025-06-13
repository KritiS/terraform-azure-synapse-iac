output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "Resource group name"
}
output "vnet_id" {
  value       = module.networking.vnet_name
  description = "Virtual network name"
}
output "key_vault_name" {
  value       = module.keyvault.keyvault_name
  description = "Azure Key Vault name"
}
output "storage_account_name" {
  value       = module.storage.storage_account_name
  description = "Storage Account name"
}
output "sql_server_fqdn" {
  value       = module.sql.sql_server_fqdn
  description = "Azure SQL Server FQDN"
}
output "sql_database_name" {
  value       = module.sql.sql_database_name
  description = "SQL database name"
}
output "synapse_workspace_name" {
  value       = module.synapse.synapse_workspace_name
  description = "Synapse Workspace name"
}
output "synapse_sql_endpoint" {
  value       = module.synapse.synapse_sql_endpoint
  description = "SQL endpoint name"
}