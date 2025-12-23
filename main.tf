module "rg" {
  source    = "./modules/rg"
  rg_config = var.rg_config
}

module "vnet" {
  source      = "./modules/vnet"
  vnet_config = var.vnet_config
  depends_on  = [module.rg]
}

module "subnet" {
  source        = "./modules/subnet"
  subnet_config = var.subnet_config
  depends_on    = [module.vnet]
}

module "pip" {
  source    = "./modules/pip"
  ip_config = var.ip_config
  depends_on = [module.rg]
}

module "nic" {
  source     = "./modules/nic"
  nic_config = var.nic_config
  depends_on = [module.subnet, module.pip]
}

module "nsg" {
  source     = "./modules/nsg"
  nsg_config = var.nsg_config
  depends_on = [module.rg]
}

module "nsg_association" {
  source          = "./modules/azurerm_network_security_group_association"
  nsg_nic_config  = var.nsg_nic_config
  depends_on      = [module.nic, module.nsg]
}

module "vm" {
  source     = "./modules/vm"
  vm_config = var.vm_config
  depends_on = [module.nic]
}
