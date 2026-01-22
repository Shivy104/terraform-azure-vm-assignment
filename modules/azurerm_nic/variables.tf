variable "nic_config" {

    type = map(object({
      nic_name = string
      network_interface_location = string
      resource_group_name = string
      subnet_name = string
      virtual_network_name = string
      

    }))
}