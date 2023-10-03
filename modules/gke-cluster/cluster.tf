resource "google_container_cluster" "cluster" {
  name                     = var.cluster_name
  location                 = var.location
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = data.google_compute_network.shared-network.self_link
  subnetwork               = data.google_compute_subnetwork.shared-subnet.self_link
  enable_shielded_nodes    = var.shielded_nodes
  #logging_service          = "logging.googleapis.com/kubernetes"
  #monitoring_service       = "monitoring.googleapis.com/kubernetes"

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = var.disablehpa
    }
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }

  maintenance_policy {
    recurring_window {
      start_time = "2023-10-02T02:00:00Z"
      end_time = "2023-10-03T10:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  
  ip_allocation_policy {
    cluster_secondary_range_name  = data.google_compute_subnetwork.shared-subnet.secondary_ip_range[local.match_pod_range_index].range_name
    services_secondary_range_name = data.google_compute_subnetwork.shared-subnet.secondary_ip_range[local.match_service_range_index].range_name
  }

  master_authorized_networks_config {
   
    cidr_blocks {
      cidr_block   = var.whitelist-ips[0]
      display_name = "sample-IPs 1"
    }
    cidr_blocks {
      cidr_block   = var.whitelist-ips[1]
      display_name = "sample-IPs 2"
    }
    cidr_blocks {
      cidr_block   = var.whitelist-ips[2]
      display_name = "sample-IPs 3"
    }

  }
}