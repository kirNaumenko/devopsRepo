resource "azurerm_resource_group" "kubernetes-cluster-rg" {
  name     = "kubernetes-cluster-rg"
  location = "Poland Central"
}

resource "azurerm_container_registry" "acr" {
  name                = "knaumenkoContainerRegistry"
  resource_group_name = azurerm_resource_group.kubernetes-cluster-rg.name
  location            = azurerm_resource_group.kubernetes-cluster-rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "knaumenko-aks"
  location            = azurerm_resource_group.kubernetes-cluster-rg.location
  resource_group_name = azurerm_resource_group.kubernetes-cluster-rg.name
  dns_prefix          = "knaumenkoaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

