resource "helm_release" "clusterissuer" {
  depends_on = [
    helm_release.cert-manager
  ]
  name      = "cluster-issuer"
  chart     = "${path.module}/helm"
  namespace = "cert-manager"
}
