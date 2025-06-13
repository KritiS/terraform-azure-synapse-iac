module "networking" {
  source              = "./modules/networking"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  vnet_name           = var.vnet_name
}

module "keyvault" {
  source              = "./modules/keyvault"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  keyvault_name       = var.keyvault_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  synapse_identity_principal_id = module.synapse.synapse_identity_principal_id
  sql_identity_principal_id     = module.sql.sql_identity_principal_id
}

module "storage" {
  source               = "./modules/storage"
  location             = var.location
  resource_group_name  = azurerm_resource_group.main.name
  storage_account_name = var.storage_account_name
  file_system_name     = var.file_system_name
  synapse_identity_principal_id = module.synapse.synapse_identity_principal_id
}

module "sql" {
  source               = "./modules/sql"
  location             = var.location
  resource_group_name  = azurerm_resource_group.main.name
  sql_server_name      = var.sql_server_name
  sql_admin_login      = var.sql_admin_login
  sql_password         = var.sql_password
  aad_admin_object_id  = data.azurerm_client_config.current.object_id
  tenant_id = data.azurerm_client_config.current.tenant_id
}

module "synapse" {
  source                 = "./modules/synapse"
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  synapse_workspace_name = var.synapse_workspace_name
  sql_admin_login        = var.sql_admin_login
  sql_password           = var.sql_password
  storage_account_name   = module.storage.storage_account_name
  file_system_name       = var.file_system_name
  storage_data_lake_gen2_filesystem_id = module.storage.file_system_id
  synapse_subnet_id                    = module.networking.synapse_subnet_id
}

module "private_endpoints" {
  source               = "./modules/private_endpoints"
  resource_group_name  = var.resource_group_name
  location             = var.location
  private_endpoints_subnet_id = module.networking.private_endpoints_subnet_id
  sql_server_id        = module.sql.sql_server_id
  synapse_workspace_id = module.synapse.synapse_workspace_id
  storage_account_id   = module.storage.storage_account_id
  key_vault_id         = module.keyvault.key_vault_id
}

module "log_analytics" {
  source               = "./modules/log_analytics"
  resource_group_name  = var.resource_group_name
  location             = var.location
  law_name             = "synapse-law"
  sql_server_id        = module.sql.sql_server_id
  synapse_workspace_id = module.synapse.synapse_workspace_id
  key_vault_id         = module.keyvault.key_vault_id
  storage_account_id   = module.storage.storage_account_id
}


resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_client_config" "current" {}
