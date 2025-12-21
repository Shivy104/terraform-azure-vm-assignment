resource "azurerm_resource_group" "rg" {
  for_each = var.resource_group_names
  name     = each.value.name
  location = each.value.location
}
