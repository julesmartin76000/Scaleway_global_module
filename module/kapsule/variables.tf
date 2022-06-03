variable "kapsule_cluster_version" {
  type = string
}

variable "kapsule_pool_size" {
  type = number
}

variable "kapsule_pool_min_size" {
  type = number
}

variable "kapsule_pool_max_size" {
  type = number
}

variable "kapsule_pool_node_type" {
  type = string
}

variable "cni" {
  type = string
}

variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}
