# gke-sharedvpc
My files to deploy a gke cluster with a shared VPC

## Inspiration

This project was inspired by [butschi84/teraform-gke](https://github.com/butschi84/terraform-gke), which provided a solid foundation for [gke-sharedvpc-terraform]. I extend my gratitude to the contributors of the original project for their valuable work.

## Technologies Used

- **Teraform**
- **Helm**
- **Kubernetes**
- **Nginx Ingress Controller**
- **Certmanager**
- **git**

### Cloud
- **GCP**

## Features

**Shared VPC**

A shared vpc allow the use of the same network in the GCP for many projects.
Inside that vpc you can make subnets to separate the work.

**GKE Cluster**

- Nodepool<br />
  1 Node (e2-small)
- Network<br />
  VPC (/16)<br />
  Subnet k8s-pod-range (sample-pod-range)<br />
  Subnet k8s-service-range (sample-svc-range)<br />
- If you want to use Workload identity please change the value to GKE_METADATA on main.tf

**Workloads**

- NGINX Ingress Controller<br />
  Creates also a Load Balancer with a Public IP in GCP
- Cert Manager<br />
  Automatic issuance of SSL-Certificates for Nginx-Ingress Resources<br />
  i.e. for the web service in module "testapp"
- Sample-App (nginx webserver)<br />
  simple web app for testing

## Variables

### edit main.tf
- To customize the cluster adjust the following sections to your needs: Project Definitions, Cluster Definitions, Service Account Definitions, Network Definitions and NodePool Definitions 

### edit modules/gke-cluster/variables.tf
- whitelist-ips => set to your private IP

## Usage

```
# initialize terraform modules
terraform init

# login google cloud gcp
gcloud auth login

# apply terraform
terraform apply
```

