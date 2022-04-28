
data "azurerm_kubernetes_cluster" "credentials" {
  name                = "example-aks1"
  resource_group_name = "rg1"
}


provider "helm" {

  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)

  }
}




module "nginx" {

  source = "github.com/saiprakash07/terraform-azurerm-nginx-ingress"

}
  
  module "external-dns" {

  source = "github.com/saiprakash07/terraform-azurerm-external-dns"

}
    
  module "cert-manager" {

  source = "github.com/saiprakash07/terraform-azurerm-cert-manager"

}
