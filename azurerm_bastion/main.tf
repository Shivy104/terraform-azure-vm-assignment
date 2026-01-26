resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = var.bastion
    content {
          name                 = ip_configuration.value.name
    subnet_id            = data.azurerm_subnet.subnet_id[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
  }
}