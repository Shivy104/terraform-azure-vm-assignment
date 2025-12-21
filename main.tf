module "rg" {
  source   = "./modules/rg"
  resource_group_names = var.resource_group_names
}

# module "vnet" {
#   source              = "./modules/vnet"
#   name                = var.vnet_name
#   location            = var.location
#   resource_group_name = var.rg_name

#   depends_on = [module.rg]
# }

# module "subnet" {
#   source               = "./modules/subnet"
#   name                 = var.subnet_name
#   resource_group_name  = var.rg_name
#   virtual_network_name = var.vnet_name

#   depends_on = [module.vnet]
# }



# module "nsg" {
#   source              = "./modules/nsg"
#   name                = "nsg-assignment"
#   location            = var.location
#   resource_group_name = var.rg_name

#   depends_on = [module.rg]
# }

# module "vm" {
#   source              = "./modules/vm"
#   name                = var.vm_name
#   location            = var.location
#   resource_group_name = var.rg_name
#   subnet_name         = var.subnet_name
#   vnet_name           = var.vnet_name

#   depends_on = [
#     module.subnet,
#     module.nsg
#   ]
# }
