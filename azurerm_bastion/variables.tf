variable "bastion"{
type = map(object({
  name = string
  location = string
  resource_group_name = string
  ip_configuration = map(object({
    name = string

  }))

  pip_name = string
  vnet_name = string
  subnet_name = string
}))

}

# updated code