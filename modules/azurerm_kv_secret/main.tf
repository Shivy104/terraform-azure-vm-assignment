resource "azurerm_key_vault_secret" "kvs" {
    for_each = var.kvs
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}