variable "project" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "sample-project"
}

variable "region" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "us-central1"
}

variable "location" {
  description = "location for k8s cluster"
  type        = string
  default     = "us-central1-c"
}

### Shared network Configuration  ###
variable "shared_network_name" {
  description = "Name of the shared network to attach the cluster"
  type = string
  default = "default"
}

variable "shared_network_project" {
  description = "Name of the project where the shared network is"
  type = string
  default = "sample-shared"
}

variable "shared_subnet_name" {
  description = "Name of the shared subnet to attach the cluster"
  type = string
  default = "default"
}

variable "shared_subnet_region" {
  description = "Name of the region where the subnet is"
  type = string
  default = "us-central1"
}

### Cluster Configuration ###
variable "cluster_name" {
  description = "name of the kubernetes cluster"
  type        = string
  default     = "sample-cluster"
}

variable "disablehpa" {
  description = "Defines horizontal pod autoscaling"
  type        = bool
  default     = true
  #use false to activate HPA
}

variable "whitelist-ips" {
  description = "ip's allowed to access k8s controlplane"
  type        = list(string)
  default     = ["1.1.1.1/32", "2.2.2.2/32", "2.2.2.2/32"]
}

variable "pod_range_name" {
  description = "Name of subnet pod range of the cluster"
  type = string
  default = "pod-range"
}

variable "ip_cidr_pod_range" {
  description = "IP range of subnet pod network of the cluster"
  type = string
  default = "10.80.0.0/24"
}

variable "service_range_name" {
  description = "Name of subnet service range of the cluster"
  type = string
  default = "service-range"
}

variable "ip_cidr_service_range" {
  description = "IP range of subnet service network of the cluster"
  type = string
  default = "10.90.0.0/24"
}

variable "shielded_nodes" {
  description = "Set shielded nodes on cluster"
  type = bool
  default = true
}

### Nodepool Configuration
variable "nodepool_name" {
  description = "name of the kubernetes nodepool"
  type        = string
  default     = "sample-pool-01"
}

variable "workload_identity_server" {
  description = "Describe the workload identity server will be used: GKE_METADATA or GKE_METADATA_SERVER"
  type = string
  default = "GCE_METADATA"
}

variable "svc_account_id" {
  description = "ID of the svc account will be used in cluster"
  type = string
}

variable "svc_account_display_name" {
  description = "Display name of the svc account will be used in cluster"
  type = string
}
variable "owner_label" {
  description = "name of cluster nodes owner"
  type = string
  default = "sample"
}

variable "nodecount" {
  description = "number of nodes"
  type        = number
  default     = 3
}

variable "machine_nodetype" {
  description = "type of nodes"
  type        = string
  default     = "e2-small"
}

variable "max_pods_node" {
  description = "max pods per node"
  type        = number
  default     = 30
}

variable "disksize" {
  description = "size of volume disks"
  type        = string
  default     = 30
}

variable "disktype" {
  description = "type of volumes disk"
  type        = string
  default     = "pd-standard"
}

variable "preemptible" {
  description = "if accept preemptible instances"
  type        = bool
  default     = false
}






