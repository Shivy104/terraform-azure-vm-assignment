variable "sqldb" {
    type = map(object({
      name_server = string
      resource_group_name = string
        name_db = string
        collation = string
        license_type = string
        max_size_gb = number
        sku_name = string
        enclave_type = string
    }))
  
}