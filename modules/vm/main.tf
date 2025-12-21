# variable "name" {}
# variable "location" {}
# variable "resource_group_name" {}
# variable "subnet_name" {}
# variable "vnet_name" {}

# resource "azurerm_network_interface" "nic" {
#   name                = "${var.name}-nic"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                          = "ipconfig1"
#     subnet_id                     = "/subscriptions/212ab218-5df9-48bc-afac-cd9389093c1b/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}/subnets/${var.subnet_name}"
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.pip.id
#   }
# }

# resource "azurerm_linux_virtual_machine" "vm" {
#   name                = var.name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   size                = "Standard_B1s"

#   network_interface_ids = [
#     azurerm_network_interface.nic.id
#   ]

#   admin_username = "azureuser"
#   admin_password = "Password1234!"
#   disable_password_authentication = false

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }

# resource "azurerm_public_ip" "pip" {
#   name                = "${var.name}-pip"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Static"
#   sku                 = "Basic"
# }