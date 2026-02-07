resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "agassoc" {
    for_each = var.agassoc
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = tolist(data.azurerm_application_gateway.backend[each.key].backend_address_pool).0.id
}