output "endpoint" {
  value = "https://${google_container_cluster.cluster.endpoint}"
}

output "certificate" {
  value = base64decode(google_container_cluster.cluster.master_auth[0].cluster_ca_certificate)
}

output "token" {
  value = data.google_client_config.current.access_token
}