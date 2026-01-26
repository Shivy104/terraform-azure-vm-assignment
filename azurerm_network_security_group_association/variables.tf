variable "nsg_nic_config" {
  type = map(object({
    nic_name = string
    resource_group_name = string
    nsg_name = string
    
  }))
  
}
