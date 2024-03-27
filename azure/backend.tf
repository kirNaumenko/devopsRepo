terraform {
  backend "azurerm" {
    resource_group_name  = "main-storage-account-rg"
    storage_account_name = "knaumenkotfstate"
    container_name       = "tfstates"
    key                  = "azureInfra.tfstate"
  }
}