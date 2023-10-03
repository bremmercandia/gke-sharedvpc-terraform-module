# #nginx ingress controller
# #================================================================================
module "ingress-nginx" {
  source = "../nginx-ingress-controller/"

  depends_on = [
    google_container_node_pool.nodepool-general
  ]
}

#  #cert manager (letsencrypt)
#  #================================================================================
 module "certmanager" {
   source = "../cert-manager/"

   depends_on = [
     google_container_node_pool.nodepool-general
   ]
 }

# #simple nginx container with an ingress
# #================================================================================
module "sample-app" {
  source   = "../sample-nginx-app/"
  hostname = "gke-ma-labs.pmweb.com.br"  
  depends_on = [
    module.ingress-nginx,
    module.certmanager
  ]
}