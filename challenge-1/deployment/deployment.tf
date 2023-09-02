resource "kubernetes_deployment" "frontend" {
  metadata {
    name = var.deployment_name
    labels = {
      name = "frontend"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = var.template_metadata_labels
    }

    template {
      metadata {
        labels = var.template_metadata_labels
      }

      spec {
        container {
          image = var.image
          name  = var.container_name
          
          port{
            container_port= 8080
          }
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          
          
        }
      }
    }
  }
}