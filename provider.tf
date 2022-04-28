
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }



    kubernetes = {
      version = "1.11.3"
    }


  }
}

provider "azurerm" {
  # Configuration options
  features {}
}
