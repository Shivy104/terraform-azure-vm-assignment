variable "ip_config" {
  type = map(object({
    public_ip_name = string
    resource_group_location = string
    resource_group_name = string
    allocation_method = string

  }))

  
}
