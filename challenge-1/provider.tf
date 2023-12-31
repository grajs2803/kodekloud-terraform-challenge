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
  config_path    = "/root/.kube/config"
}

module "service" {
  source = "./service"
}

module "deployment" {
  source = "./deployment"
  replicas = 4
}