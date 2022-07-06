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

variable "autoscaling" {
  type    = bool
  default = true
}

variable "autohealing" {
  type    = bool
  default = true
}

variable "disable_scale_down" {
  type    = bool
  default = false
}

variable "ignore_daemonsets_utilization" {
  type    = bool
  default = true
}

variable "balance_similar_node_groups" {
  type    = bool
  default = true
}

variable "scale_down_delay_after_add" {
  type    = string
  default = "5m"
}

variable "autoscaler_config_estimator" {
  type    = string
  default = "binpacking"
}

variable "autoscaler_config_expander" {
  type    = string
  default = "random"
}

variable "expendable_pods_priority_cutoff" {
  type    = number
  default = -5
}

variable "auto_upgrade_enable" {
  type    = bool
  default = true
}

variable "maintenance_window_start_hour" {
  type    = number
  default = 4
}

variable "maintenance_window_day" {
  type    = string
  default = "sunday"
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
