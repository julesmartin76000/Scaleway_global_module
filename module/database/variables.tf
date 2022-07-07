variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}

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

variable "private_network_id" {
  type = string
}

variable "user_name" {
  type      = string
  sensitive = true
}

variable "rdb_instance_volume_size_in_gb" {
  type = string
}

variable "rdb_user_root_password" {
  type      = string
  sensitive = true
}

variable "rdb_user_scaleway_db_password" {
  type      = string
  sensitive = true
}

variable "rdb_instance_volume_type" {
  type = string
}

variable "instance_ip_addr" {
  type = string
}
