resource "azurerm_log_analytics_workspace" "main" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Diagnostic Settings for SQL Server
resource "azurerm_monitor_diagnostic_setting" "sql" {
  name               = "sql-diag"
  target_resource_id = var.sql_server_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "SQLSecurityAuditEvents"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# Diagnostic Settings for Synapse
resource "azurerm_monitor_diagnostic_setting" "synapse" {
  name               = "synapse-diag"
  target_resource_id = var.synapse_workspace_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "SynapseWorkspaceAuditLogs"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# Diagnostic Settings for Key Vault
resource "azurerm_monitor_diagnostic_setting" "keyvault" {
  name               = "kv-diag"
  target_resource_id = var.key_vault_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "AuditEvent"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# Diagnostic Settings for Storage
resource "azurerm_monitor_diagnostic_setting" "storage" {
  name               = "storage-diag"
  target_resource_id = var.storage_account_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "StorageRead"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageDelete"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
