resource "kubernetes_service" "webapp-service" {
  metadata {
    name = "webapp-service"
  }
  spec {
    selector = var.service_selector

    port {
      port        = var.port
      target_port = var.target_port
      node_port   = var.node_port
    }

    type = var.service_type
  }
}
