variable "vnet_config" {
  type = map(object({
    virtual_network_name = string
    address_space = list(string)
    virtual_network_location = string
    resource_group_name = string
  }))
}