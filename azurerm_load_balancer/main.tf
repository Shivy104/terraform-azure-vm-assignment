variable "lb" {
    type = map(object({
      lbname = string
      location = string
      resource_group_name = string
      frontend_ip_configuration = map(object({
        name = string

      }))
      bapname = string
      lbprobename = string
      port = number
      lbrulename = string
      protocol = string
      frontend_port = number
      backend_port = number
      frontend_ip_configuration_name = string
      pipname = string
      
    }))
  
}

data "azurerm_public_ip" "pip" {
    for_each = var.lb
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_lb" "lb" {
    for_each = var.lb
  name                = each.value.lbname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
         name                 = frontend_ip_configuration.value.name
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
  }


}

resource "azurerm_lb_backend_address_pool" "bap" {
    for_each = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.bapname
}

resource "azurerm_lb_probe" "lbprobe" {
  for_each = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.lbprobename
  port            = each.value.port
}

resource "azurerm_lb_rule" "lbrule" {
    for_each = var.lb
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.lbrulename
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.bap[each.key].id]
  probe_id = azurerm_lb_probe.lbprobe[each.key].id
}

