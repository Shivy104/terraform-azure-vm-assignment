rg_config = {
  "rg1" = {
    resource_group_name               = "rg-shivam"
    resource_group_location = "East US"
  }
}

vnet_config = {
  "dev-vnet" = {
    virtual_network_name        = "dev-vnet"
    address_space      = ["10.0.0.0/16"]
    resource_group_name = "rg-shivam"
    virtual_network_location           = "East US"
  }
}

subnet_config = {
  "dev-subnet" = {
    subnet_name          = "dev-subnet"
    resource_group_name  = "rg-shivam"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

"bastion-subnet" = {
    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "rg-shivam"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  "vmss-subnet" = {
    subnet_name          = "vmss-Subnet"
    resource_group_name  = "rg-shivam"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }

  "ag-subnet" = {
    subnet_name          = "ag-Subnet"
    resource_group_name  = "rg-shivam"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.4.0/24"]
  }

  
}

ip_config = {
  "lbpip" = {
    public_ip_name        = "lbpip"
    resource_group_name   = "rg-shivam"
    resource_group_location             = "East US"
    allocation_method   = "Static"
  }

    "pip2" = {
    public_ip_name        = "bastionpip"
    resource_group_name   = "rg-shivam"
    resource_group_location             = "East US"
    allocation_method   = "Static"
  }

      "pip3" = {
    public_ip_name        = "agpip"
    resource_group_name   = "rg-shivam"
    resource_group_location             = "East US"
    allocation_method   = "Static"
  }
}



nic_config = {
  "nic1" = {
    nic_name                    = "nic11"
    resource_group_name         = "rg-shivam"
    network_interface_location           = "East US"
    subnet_name                 = "dev-subnet"
    virtual_network_name        = "dev-vnet"
    # public_ip_name              = "pip1"
  }

    "nic2" = {
    nic_name                    = "nic22"
    resource_group_name         = "rg-shivam"
    network_interface_location           = "East US"
    subnet_name                 = "dev-subnet"
    virtual_network_name        = "dev-vnet"
    # public_ip_name              = "pip1"
  }
}

nsg_config = {
  "nsg1" = {
    nsg_name                = "nsg1"
    resource_group_name     = "rg-shivam"
    location                = "East US"
    security_rule = [
      {
            name                       = "http"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
      }
    ]

  }
    "nsg2" = {
    nsg_name                = "nsg2"
    resource_group_name     = "rg-shivam"
    location                = "East US"
    security_rule = [
      {
            name                       = "http"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
      }
      ]
  }
}

nsg_nic_config = {
  "assoc1" = {
    nic_name                = "nic11"
    nsg_name                = "nsg1"
    resource_group_name     = "rg-shivam"
  }

    "assoc2" = {
    nic_name                = "nic22"
    nsg_name                = "nsg2"
    resource_group_name     = "rg-shivam"
  }
}

vm_config = {
  "vm1" = {
    vm_name          = "frontendvm420"
    resource_group_name = "rg-shivam"
    location        = "East US"
    nic_name        = "nic11"
    vm_size         = "Standard_B1s"
    admin_username  = "azureuser"
    admin_password  = "P@ssw0rd1234!"
    os_disk = [{
          caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    }]

    source_image_reference = [{
          publisher = "Canonical"
          offer     = "0001-com-ubuntu-server-jammy"
          sku       = "22_04-lts"
          version   = "latest"
    }]
  }

    "vm2" = {
    vm_name          = "backendvm420"
    resource_group_name = "rg-shivam"
    location        = "East US"
    nic_name        = "nic22"
    vm_size         = "Standard_B1s"
    admin_username  = "azureuser"
    admin_password  = "P@ssw0rd1234!"
        os_disk = [{
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
    }]

    source_image_reference = [{
          publisher = "Canonical"
          offer     = "0001-com-ubuntu-server-jammy"
          sku       = "22_04-lts"
          version   = "latest"
    }]

  }
}

kv = {
  kv1 = {
    kv_name = "shivam-kv4200420"
    location = "East US"
    resource_group_name = "rg-shivam"
  }
  
}

kvs = {
  kvs1 = {
    kv_name = "shivam-kv4200420"
    resource_group_name = "rg-shivam"
    secret_name = "shhhhhh-admin1"
    secret_value = "admin-12"

  }

  kvs2 = {
       kv_name = "shivam-kv4200420"
    resource_group_name = "rg-shivam"
    secret_name = "shhhhhh-password1"
    secret_value = "Password@123"

  }
}

server = {
  sql_server1 = {
  name                         = "mssqlserver420-new"
  resource_group_name          = "rg-shivam"
  location                     = "Central India"
  version                      = "12.0"
  administrator_login          = "sqlserveradmin"
  administrator_login_password = "Password@123"
  minimum_tls_version          = "1.2"
  }
}

sqldb = {

sqldb1 = {
  name_server        = "mssqlserver420-new"
  resource_group_name = "rg-shivam"
  name_db = "sqldb420-new"
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}

}

stg = {
  stg1 = {
    name = "billustg420"
      resource_group_name = "rg-shivam"
      location  = "East US"
      account_tier = "Standard"
      account_replication_type = "GRS"
  }
}

law = {
  law1 = {
       name = "likelaw420"
      location = "East US"
      resource_group_name =  "rg-shivam"
      sku = "PerGB2018"
      retention_in_days = 30
  }
}

bastion = {
  bastion1 = {
     name = "bastion420"
  location = "East US"
  resource_group_name = "rg-shivam"
  ip_configuration = {
    ipc1 = {
      name = "configuration"
    }


  }

  pip_name = "bastionpip"
  vnet_name = "dev-vnet"
  subnet_name = "AzureBastionSubnet"
  }
}

lb = {
  lb1 = {
        lbname = "lb420"
      location = "East US"
      resource_group_name = "rg-shivam"
      frontend_ip_configuration = {
        frontend_ip_configuration = {
        name = "fipc-420"
        }
    

      }
      bapname = "bap420"
      lbprobename = "lbprobe420"
      port = 80
      lbrulename = "lbrule420"
      protocol = "Tcp"
      frontend_port = 80
      backend_port = 80
      frontend_ip_configuration_name = "fipc-420"
      pipname = "lbpip"
  }
}

acr1 = {
  acr11 = {
    name = "acr420"
    resource_group_name = "rg-shivam"
    location = "East US"
    sku = "Premium"
    admin_enabled = false
    georeplications = [
      {
        location = "Central India"
        zone_redundancy_enabled = false
      }

    ]
  }
}

aks = {
  aks1 = {
    name = "aks420"
    location = "East US"
    resource_group_name = "rg-shivam"
    dns_prefix          = "dnsaks1"
    default_node_pool = {
      dnp1 = {
        name = "default"
        node_count = 1
        vm_size = "Standard_D2_v2"
      }
    }

    identity = [
      {
        type = "SystemAssigned"
      }
    ]
  }
}


lbassoc = {
  # lbassoc1 = {
    # ip_configuration_name = "internal"
    # nic_name = "nic11"
    # resource_group_name = "rg-shivam"
    # lb_name = "lb420"
    # bap_name = "bap420"
  # }
  lbassoc2 = {
    ip_configuration_name = "internal"
    nic_name = "nic22"
    resource_group_name = "rg-shivam"
    lb_name = "lb420"
    bap_name = "bap420"
  }

}

vmss = {
  vmss1 = {
    name = "vmss420"
    subnet_name = "vmss-Subnet"
    virtual_network_name = "dev-vnet"
    resource_group_name = "rg-shivam"
    location = "East US"
    sku = "Standard_F2"
    instances = 2
    admin_username = "adminuser"
    password = "Password@123"
    disable_password_authentication = false
    source_image_reference = [
      {
           publisher = "Canonical"
           offer     = "0001-com-ubuntu-server-jammy"
           sku       = "22_04-lts"
           version   = "latest"
      }
    ]
    os_disk = [
      {
            storage_account_type = "Standard_LRS"
            caching              = "ReadWrite"
      }
    ]
    network_interface = [
      {
        name    = "vmssnic420"
        primary = true
        ip_configuration = [
          {
             name      = "internal"
             primary   = true
          }
        ]
      }
      
    ]
    
  }
}

appgateway = {
  ag1 = {
    subnet_name = "ag-Subnet"
        virtual_network_name = "dev-vnet"
        pip_name = "agpip"
      name = "ag420"
      resource_group_name = "rg-shivam"
      location = "East US"
      sku = [
        {
            name     = "Standard_v2"
            tier     = "Standard_v2"
            capacity = 2
        }
      ]
      gateway_ip_configuration = [
        {
             name      = "my-gateway-ip-configuration"
        }
      ]

      frontend_port = [
        {
              name = "frontendport420"
              port = 80
        }
      ]

      frontend_ip_configuration = [
        {
          name = "feic420"
        }
      ]
      
      backend_address_pool = [
        {
          name = "agbap420"
        }
      ]

      backend_http_settings = [
        {
              name = "backendhttpsettings420"
              cookie_based_affinity = "Disabled"
              path                  = "/path1/"
              port                  = 80
              protocol              = "Http"
              request_timeout       = 60
        }
      ]
      http_listener = [
        {
              name                           = "aghttplistner420"
              frontend_ip_configuration_name = "feic420"
              frontend_port_name             = "frontendport420"
              protocol                       = "Http"
        }
      ]

      request_routing_rule = [
        {
              name                       = "requestroutingrule420"
              priority                   = 9
              rule_type                  = "Basic"
              http_listener_name         = "aghttplistner420"
              backend_address_pool_name  = "agbap420"
              backend_http_settings_name = "backendhttpsettings420"
        }
      ]
        }
  }


agassoc = {
  agassoc1 = {
    ip_configuration_name = "internal"
    nic_name = "nic11"
    resource_group_name = "rg-shivam"
    application_gateway_name = "ag420"
  }
}

