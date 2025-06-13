resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2" 
  is_hns_enabled           = true
  min_tls_version          = "TLS1_2"
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "fs" {
  name               = var.file_system_name
  storage_account_id = azurerm_storage_account.storage.id
}
resource "azurerm_role_assignment" "synapse_storage_access" {
  scope                = azurerm_storage_account.storage.id 
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.synapse_identity_principal_id 
}