terraform {
  backend "azurerm" {
    resource_group_name  = "Sample"
    storage_account_name = "saterragitkvnv"
    container_name       = "containertfkvnv"
    key                  = "prod.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}