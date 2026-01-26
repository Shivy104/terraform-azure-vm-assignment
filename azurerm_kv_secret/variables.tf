variable "kvs" {
    type = map(object({
      kv_name = string
      resource_group_name = string
      secret_name = string
      secret_value = string 
    }))

  
}
