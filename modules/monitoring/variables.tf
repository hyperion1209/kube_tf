variable "namespace" {
  description = "AWS Namespace where resources are built"
  type = string
}

variable "stage" {
  description = "Development stage where resources are built"
  type = string
}

variable "iam_proxy_role_arn" {
  description = "The arn of the iam role used for remote write"
  type = string
}
