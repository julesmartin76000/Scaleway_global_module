#General
variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}

# Instance
variable "instance_type" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "instance_size_in_gb" {
  type = number
}

variable "volume_size_in_gb" {
  type = number
}

variable "volume_type" {
  type = string
}

variable "tags" {
  type = list(any)
}

# Database
variable "rdb_is_ha_cluster" {
  type = bool
}

variable "rdb_disable_backup" {
  type = bool
}

variable "rdb_instance_node_type" {
  type = string
}

variable "rdb_instance_engine" {
  type = string
}

variable "user_name" {
  type = string
}

variable "rdb_instance_volume_size_in_gb" {
  type = string
}

variable "rdb_user_root_password" {
  type = string
}

variable "rdb_user_scaleway_db_password" {
  type = string
}

variable "rdb_instance_volume_type" {
  type = string
}

# Kapsule
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

# LoadBalancer
variable "lb_size" {
  type = string
}

variable "inbound_port" {
  type = string
}

variable "forward_port" {
  type = string
}

variable "forward_protocol" {
  type = string
}

# VPC
variable "public_gateway_dhcp" {
  type = string
}

variable "public_gateway_type" {
  type = string
}

# VPC
variable "bastion_port" {
  type = string
}
