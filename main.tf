resource "kubernetes_service" "checkpoint" {
  metadata {
    name = "terraform-checkpoint"
  }
  spec {
    selector = {
      app = kubernetes_pod.checkpoint.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "checkpoint" {
  metadata {
    name = "terraform-checkpoint"
    labels = {
      app = "MyApp"
    }
  }

  spec {
    replicas = 3
    template {
      labels = {
        app = "MyApp"
      }
    }
    spec {
      container { 
       image = "guylurieg/checkpoint"
       name = "checkpointContainer"
      }
     }
   }
}
