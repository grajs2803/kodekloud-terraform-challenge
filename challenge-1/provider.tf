terraform {
  required_providers {

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}

provider "kubernetes" {
  # Configuration options
  config_path    = "~/.kube/config"
}

module "service" {
  source = "./service"
  service_selector = module.deployment.kubernetes_deployment.frontend.spec.0.template.0.metadata.0.labels
}

module "deployment" {
  source = "./deployment"
  replicas = 4
}