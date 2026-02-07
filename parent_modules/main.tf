module "rg" {
  source    = "../modules/azurerm_rg"
  rg_config = var.rg_config
}

module "vnet" {
  source      = "../modules/azurerm_vnet"
  vnet_config = var.vnet_config
  depends_on  = [module.rg]
}

module "subnet" {
  source        = "../modules/azurerm_subnet"
  subnet_config = var.subnet_config
  depends_on    = [module.vnet]
}

module "pip" {
  source    = "../modules/azurerm_pip"
  ip_config = var.ip_config
  depends_on = [module.rg]
}

module "nic" {
  source     = "../modules/azurerm_nic"
  nic_config = var.nic_config
  depends_on = [module.subnet, module.pip]
}

module "nsg" {
  source     = "../modules/azurerm_nsg"
  nsg_config = var.nsg_config
  depends_on = [module.rg]
}

module "nsg_association" {
  source          = "../modules/azurerm_network_security_group_association"
  nsg_nic_config  = var.nsg_nic_config
  depends_on      = [module.nic, module.nsg]
}

module "vm" {
  source     = "../modules/azurerm_vm"
  vm_config = var.vm_config
  depends_on = [module.nic , module.rg]
}

module "KV" {
  depends_on = [ module.rg ]
  source = "../modules/azurerm_KV"
  kv = var.kv
  
}

module "kvs" {
  depends_on = [ module.KV ]
  source = "../modules/azurerm_kv_secret"
  kvs = var.kvs
  
}

module "sql_server" {
  depends_on = [ module.rg ]
  source = "../modules/azurerm_sql_server"
  sql_server = var.server
}

module "sqldb" {
  depends_on = [ module.sql_server ]
  source = "../modules/azurerm_sqldatabase"
  sqldb = var.sqldb
  
}

module "stg" {
  depends_on = [ module.rg ]
  source = "../modules/azurerm_storage_account"
  stg = var.stg
  
}

module "law" {
  depends_on = [ module.rg ]
  source = "../modules/azurerm_log_analytics_workspace"
  law = var.law
  
}

module "bastion" {
  depends_on = [ module.rg, module.subnet, module.pip ]

  source = "../modules/azurerm_bastion"
  bastion = var.bastion
}

module "lb" {
  depends_on = [ module.rg, module.pip ]
  source = "../modules/azurerm_load_balancer"
  lb = var.lb
  
}

module "acr" {
  depends_on = [ module.rg ]
  source = "../modules/azurerm_acr"
  acr = var.acr1
  
}

module "aks" {
  depends_on = [ module.rg ]
  source = "../modules/azurerm_aks"
  aks = var.aks
  
}

module "lbassoc" {
  depends_on = [ module.rg , module.lb , module.nic]
  source = "../modules/azurerm_lb_associate"
  lbassoc = var.lbassoc
  
}


module "vmss" {
  depends_on = [ module.rg , module.subnet ]
  source = "../modules/azurerm_vmss"
  vmss = var.vmss
  
}

module "ag" {
  depends_on = [ module.rg , module.subnet , module.pip]
  source = "../modules/azurerm_ag"
  appgateway = var.appgateway
  
}

module "agassoc" {
  source = "../modules/azurerm_agassociate"
  depends_on = [ module.nic, module.ag]
  agassoc = var.agassoc
  
}