resource "helm_release" "sample-chart" {
  name      = "sample-chart"
  chart     = "${path.module}/helm"
  namespace = "default"

  set {
    name  = "hostname"
    value = var.hostname
  }

  timeout = 60
}

variable "hostname" {
  type = string
}