terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Demo" #Resource Group for the Terraform State file and Lock file
    storage_account_name = "saterragitkvnv" #Storage Account for the Terraform State file and Lock file
    container_name       = "containertfkvnv" #Container for teh Terraform State file and Lock file
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}