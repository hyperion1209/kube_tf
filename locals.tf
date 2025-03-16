locals {
  accounts             = { dev = "594515248465", prod = "966729917627" }
  project_name         = "kubernetes"
  region               = "eu-central-1"
  permanent_workspaces = ["dev", "prod"]
  profile              = contains(local.permanent_workspaces, terraform.workspace) ? terraform.workspace : "dev"
  namespace            = lower(join("-", [local.project_name, terraform.workspace]))
  cluster_name         = local.namespace
}
