# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_service_account" "svc_account" {
  account_id   = var.svc_account_id
  display_name = var.svc_account_display_name
}

resource "google_container_node_pool" "nodepool-general" {
  name       = var.nodepool_name
  cluster    = google_container_cluster.cluster.id
  node_count = var.nodecount
  max_pods_per_node = var.max_pods_node

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_nodetype
    disk_size_gb = var.disksize
    disk_type = var.disktype
    service_account = google_service_account.svc_account.email

    workload_metadata_config {
      mode = var.workload_identity_server
    }

    labels = {
      owner = var.owner_label
    }
  }
}