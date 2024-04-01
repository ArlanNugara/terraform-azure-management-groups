terraform {
  required_version = "~> 1.7.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "PLACEHOLDER"
    storage_account_name = "PLACEHOLDER"
    container_name       = "tfstate"
    key                  = "PLACEHOLDER"
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = data.azurerm_client_config.current.tenant_id
}