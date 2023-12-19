#===================== Principal Modules =====================#
module "sample-cluster" {
  source = "./modules/gke-cluster"
#-------------------------------------------------
  #Project Definitions
  project = "sample-project"
  region = "us-central1"
  location = "us-central1-c"
#-------------------------------------------------
  #Cluster Definitions
  cluster_name = "sample-cluster"
  disablehpa = false
  shielded_nodes = true
#-------------------------------------------------  
  #Network Definitions
  #Use this in either way: VPC or Shared VPC -- Refers to IP_ALLOCATION-POLICY
  pod_range_name = "sample-pod-range"
  service_range_name = "sample-svc-range"

  #Use this variables if you use a shared VPC
  shared_network_name = "sample-shared"
  shared_network_project = "sample-shared"
  shared_subnet_name = "sample-shared-subnet"
  shared_subnet_region = "us-central1"
#-------------------------------------------------
  #Service Account Definitions
  svc_account_id = "sample-account"
  svc_account_display_name = "sample-account"
#-------------------------------------------------
  #NodePool Definitions
  nodepool_name = "sample-pool-01"
  machine_nodetype = "e2-small"
  disktype = "pd-balanced"
  disksize = 50
  nodecount = 3
  max_pods_node = 80
  workload_identity_server = "GCE_METADATA" #GKE_METADATA for workload identity and GCE_METADA for default
  owner_label = "sample"
}
