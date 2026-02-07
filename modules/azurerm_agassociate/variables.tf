variable "agassoc" {
    type = map(object({
    ip_configuration_name = string
    nic_name = string
    resource_group_name = string
    application_gateway_name = string
    }))
  
}