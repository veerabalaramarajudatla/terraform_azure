terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Demo"
    storage_account_name = "saterragitkvnv"
    container_name       = "containertfkvnv"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}