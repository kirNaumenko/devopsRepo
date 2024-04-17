resource "azurerm_resource_group" "kubernetes-cluster-rg" {
  name     = "kubernetes-cluster-rg"
  location = "Poland Central"
}

resource "azurerm_container_registry" "acr" {
  name                = "knaumenkoContainerRegistry"
  resource_group_name = azurerm_resource_group.kubernetes-cluster-rg.name
  location            = azurerm_resource_group.kubernetes-cluster-rg.location
  sku                 = "Basic"
}