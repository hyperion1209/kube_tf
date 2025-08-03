provider "aws" {
  region = local.region
  assume_role {
    role_arn = "arn:aws:iam::594515248465:role/netauto_terraform"
    session_name = "terraform_session"
  }
}

# data "aws_eks_cluster" "this" {
#  name = local.cluster_name
# }

# provider "kubernetes" {
#  host                   = data.aws_eks_cluster.this.endpoint
#  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
#  exec {
#    api_version = "client.authentication.k8s.io/v1beta1"
#    command     = "aws"
#    args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
#  }
# }

# provider "helm" {
#   kubernetes = {
#     host                   = data.aws_eks_cluster.this.endpoint
#     cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
#     exec = {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       command     = "aws"
#       args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
#     }
#   }
# }
