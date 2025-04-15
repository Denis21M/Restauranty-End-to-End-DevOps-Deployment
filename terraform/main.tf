resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "aks-${var.aks_cluster_name}"
  

  default_node_pool {
    name       = "default"
    node_count = var.agent_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  tags = {
    Environment = "Dev"
  }
}

resource "azurerm_public_ip" "ingress_ip" {
  name                = "ingress-public-ip"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "bud-restauranty-app"
}

output "ingress_public_ip" {
  value = azurerm_public_ip.ingress_ip.ip_address
}
