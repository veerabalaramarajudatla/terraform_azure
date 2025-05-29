terraform {
  backend "azurerm" {
    resource_group_name  = "Demo" #Resource Group for the Terraform State File
    storage_account_name = "saterragitkvnv" #Storage Account for the Terraform State File
    container_name       = "containertfkvnv" #Container for the Terraform State File
    key                  = "prod.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0" #Hasicop Terraform Vesrion for Azure
    }
  }
}

provider "azurerm" {
  features {}
}