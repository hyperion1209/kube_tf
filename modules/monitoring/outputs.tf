output "prometheus" {
  description = "Prometheus EKS object details"
  value = {
    service_account = kubernetes_service_account.amp-iamproxy-ingest-role.id
    namespace = kubernetes_namespace.prometheus.id
    endpoint = aws_prometheus_workspace.this.prometheus_endpoint
  }
}
