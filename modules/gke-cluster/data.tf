data "google_client_config" "current" {
}

# data of kubernetes cluster
data "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.location
  project  = var.project
  depends_on = [
    google_container_cluster.cluster
  ]
}