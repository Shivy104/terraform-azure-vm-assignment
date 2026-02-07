data "azurerm_network_interface" "nic" {
    for_each = var.agassoc
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_application_gateway" "backend" {
    for_each = var.agassoc
  name                = each.value.application_gateway_name
  resource_group_name = each.value.resource_group_name
}
