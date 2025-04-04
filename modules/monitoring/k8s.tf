resource "kubernetes_namespace" "prometheus" {
  metadata {
    labels = {
      stage = var.stage
      application = "prometheus"
    }

    name = "prometheus"
  }
}

resource "kubernetes_service_account" "amp-iamproxy-ingest-role" {
  metadata {
    namespace = kubernetes_namespace.prometheus.id
    name = "amp-iamproxy-ingest-role"
    annotations = {
      "eks.amazonaws.com/role-arn" = var.iam_proxy_role_arn
    }
  }
}
