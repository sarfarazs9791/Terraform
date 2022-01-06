  terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.90.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features{}
  subscription_id="0356b164-fd8c-4b47-aac9-a5a38b5abe7d"
}


