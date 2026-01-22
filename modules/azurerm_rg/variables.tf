variable "rg_config" {
  type = map(object({
    resource_group_name = string
    resource_group_location = string
  }))
}