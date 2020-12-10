# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "Rg_Com_Terraform"
  location = "brazilsouth"
 
tags = {
        Environment = "Terraform Getting Started"
        Team = "DevOps"
    }
}
