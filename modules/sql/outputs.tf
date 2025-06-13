output "sql_server_fqdn" {
  value = azurerm_sql_server.sql.fully_qualified_domain_name
}

output "sql_database_name" {
  value = azurerm_sql_database.db.name
}
output "sql_identity_principal_id" {
  value = azurerm_sql_server.sql.identity[0].principal_id
}
output "sql_server_id" {
  value = azurerm_sql_server.sql.id
}