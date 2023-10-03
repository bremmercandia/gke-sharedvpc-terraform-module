provider "google" {
  project = "sample-project"
  region = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "bucket"
    prefix = "path"
  
  }
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 4.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  host                   = module.sample-cluster.endpoint
  cluster_ca_certificate = module.sample-cluster.certificate
  token                  = module.sample-cluster.token
}

provider "helm" {
  kubernetes {
    host                   = module.sample-cluster.endpoint
    cluster_ca_certificate = module.sample-cluster.certificate
    token                  = module.sample-cluster-cluster.token
  }
}