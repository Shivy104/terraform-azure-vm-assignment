variable "resource_group_names" {
  type = map(object({
    name     = string
    location = string
  }))
}