resource "aws_prometheus_workspace" "this" {
  alias = "${var.namespace}-amp"
}
