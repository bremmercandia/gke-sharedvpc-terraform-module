# gke-sharedvpc
My files to deploy a gke cluster with a shared VPC

## Shared VPC
A shared vpc allow the use of the same network in the GCP for many projects.
Inside that vpc you can make subnets to separate the work.

**GKE Cluster**

- Nodepool<br />
  1 Node (e2-small)
- Network<br />
  VPC (10.0.0.0/18)<br />
  Subnet k8s-pod-range (sample-pod-range)<br />
  Subnet k8s-service-range (sample-svc-range)<br />
- If you want to use Workload identity please change the value to GKE_METADATA on main.tf

**Workloads**

- NGINX Ingress Controller (HELM Chart)<br />
  Creates also a Load Balancer with a Public IP in GCP
- Cert Manager (HELM Chart)<br />
  Automatic issuance of SSL-Certificates for Nginx-Ingress Resources<br />
  i.e. for the web service in module "testapp"
- Test-App (nginx webserver)<br />
  simple web app for testing

**Variables**

# edit main.tf
- To customize the cluster adjust the following sections to your needs: Project Definitions, Cluster Definitions, Service Account Definitions, Network Definitions and NodePool Definitions 

# edit variables.tf
- whitelist-ips => set to your private IP


![cluster](docs/images/cluster.png)

# Usage

```
# initialize terraform modules
terraform init

# login google cloud gcp
gcloud auth login


# apply terraform chart
terraform apply
```