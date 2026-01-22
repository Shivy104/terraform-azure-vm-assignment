variable "vm_config" {
  type = map(object({
    nic_name = string
    vm_name = string
    resource_group_name = string
    location = string
    vm_size = string
    admin_username = string
    admin_password = string
    os_disk = list(object({
      caching = string
      storage_account_type = string
    }))
    source_image_reference = list(object({
      publisher = string
      offer = string
      sku = string
      version = string
    }))

  }))
  
}