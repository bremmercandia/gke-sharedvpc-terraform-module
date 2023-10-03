# ### CREATE A NEW VPC AND SUBNET ###
# resource "google_compute_network" "vpc" {
#   name                    = var.vpc_name
#   auto_create_subnetworks = false
#   project                 = var.project
#   routing_mode            = "REGIONAL"
#   mtu                     = "1460"

#   # depends_on = [
#   #   google_project_service.compute,
#   #   google_project_service.container
#   # ]
# }

# resource "google_compute_subnetwork" "subnet" {
#   name = var.subnet_name
#   ip_cidr_range = "10.0.0.0/18"
#   region = var.region
#   network = google_compute_network.vpc.id
#   private_ip_google_access = true

#   secondary_ip_range = [ 
#     {
#       range_name = var.pod_range_name
#       ip_cidr_range = var.ip_cidr_pod_range 
#     },
#     {
#       range_name = var.service_range_name
#       ip_cidr_range = var.ip_cidr_service_range
#     }
#   ]
# }

### SHARED VPC ###

#To attach a first service project with host project 
resource "google_compute_shared_vpc_service_project" "shared-vpc-link-projects" {
  host_project    = "pmwebcdp"
  service_project = "pmweb-infra"
}

# # # Shared Network to attach 
data "google_compute_network" "shared-network" {
  name    = var.shared_network_name
  project = var.shared_network_project
}
# # # Shared Sub-Networks to attach 
data "google_compute_subnetwork" "shared-subnet" {
  name    = var.shared_subnet_name
  project = var.shared_network_project
  region  = var.shared_subnet_region

}
locals {
  #returns the index of the element
  match_pod_range_index = index([for ip_range in data.google_compute_subnetwork.shared-subnet.secondary_ip_range : ip_range.range_name], var.pod_range_name)
  match_service_range_index = index([for ip_range in data.google_compute_subnetwork.shared-subnet.secondary_ip_range : ip_range.range_name], var.service_range_name)
}
