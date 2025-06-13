resource "azurerm_synapse_workspace" "synapse" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.sql_admin_login
  sql_administrator_login_password     = var.sql_password
  public_network_access_enabled = false
  
  identity {
    type = "SystemAssigned"
  }
  managed_virtual_network_enabled = true
  #subnet_id                       = var.synapse_subnet_id
}
