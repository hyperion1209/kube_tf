provider "aws" {
  region = local.region
}

data "aws_eks_cluster" "this" {
 name = local.cluster_name
}

provider "kubernetes" {
 host                   = data.aws_eks_cluster.this.endpoint
 cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
 exec {
   api_version = "client.authentication.k8s.io/v1beta1"
   command     = "aws"
   args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
 }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
    }
  }
}
