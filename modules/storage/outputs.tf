output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}
output "file_system_id" {
  value = azurerm_storage_data_lake_gen2_filesystem.fs.id
}
