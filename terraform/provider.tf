provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.6.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.98.0"
      api_version_override = "2024-04-02-preview"
    }
  }
}
