resource "azurerm_sql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_password
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_sql_database" "db" {
  name                = "maindb"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql.name
  edition                        = "Basic"
  requested_service_objective_name = "Basic"
  collation = "SQL_Latin1_General_CP1_CI_AS"
}

resource "azurerm_sql_active_directory_administrator" "aad_admin" {
  server_name         = azurerm_sql_server.sql.name
  resource_group_name = var.resource_group_name
  login               = "AADAdmin"
  tenant_id           = var.tenant_id
  object_id           = var.aad_admin_object_id
}