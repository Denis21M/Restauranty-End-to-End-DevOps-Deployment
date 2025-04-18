output "aks_resource_group" {
  value = azurerm_resource_group.aks_rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "ingress_public_ip" {
 value = azurerm_public_ip.ingress_ip.ip_address
}


