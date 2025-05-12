resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = var.app_name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = {
            app = var.app_name
        }
      }
      spec {
        container {
          name = var.app_name
          image = var.image_name
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "flask_app_svc" {
  metadata {
    name = "$(var.app_name)-service"
  }
  spec {
    selector = {
        app = var.app_name
    }
    type = "NodePort"
    port {
      port = 80
      target_port = 5000
      node_port = 30080
    }
  }
}