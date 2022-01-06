terraform {
  backend "azurerm" {
    resource_group_name  = "RG2"
    storage_account_name = "backend2022"
    container_name       = "terraform"
    key                  = "terraform.terraform.tfstate"
  }
}

