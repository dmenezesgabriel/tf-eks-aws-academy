variable "region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "postech-challenge-3"
}

variable "instance_type" {
  default = "t3.small" # t3.micro | t3a.medium
}

variable "eks_policy_arn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "access_config" {
  default = "API_AND_CONFIG_MAP"
}
