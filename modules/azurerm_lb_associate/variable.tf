variable "lbassoc" {
    type = map(object({
      ip_configuration_name = string
      nic_name = string
      resource_group_name = string
      lb_name = string
      bap_name = string 
    }))
  
}