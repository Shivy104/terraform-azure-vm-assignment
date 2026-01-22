data "azurerm_mssql_server" "sqlserver" {
    for_each = var.sqldb
  name                = each.value.name_server
  resource_group_name = each.value.resource_group_name
}