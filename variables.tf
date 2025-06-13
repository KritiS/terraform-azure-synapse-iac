variable "location" {}
variable "resource_group_name" {}
variable "vnet_name" {}
variable "subnet_names" { type = list(string) }
variable "keyvault_name" {}
variable "storage_account_name" {}
variable "sql_server_name" {}
variable "sql_admin_login" {}
variable "sql_password" {}
variable "synapse_workspace_name" {}
variable "file_system_name" {}
variable "keyvault" {}