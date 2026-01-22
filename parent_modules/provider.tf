terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  # backend "azurerm" {}
}

provider "azurerm" {
  # Configuration options
features {
  
}
subscription_id = "212ab218-5df9-48bc-afac-cd9389093c1b"
}

