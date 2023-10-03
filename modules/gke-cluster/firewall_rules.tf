# resource "google_compute_firewall" "allow-ssh" {
#   name    = "allow-ssh"
#   network = google_compute_network.vpc.name

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = var.whitelist-ips
# }

# resource "google_compute_firewall" "allow-http-https" {
#   name = "allow-http-https"
#   network = google_compute_network.vpc.name

#   allow {
#     protocol = "tcp"
#     ports = ["80","443"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }