
resource "scaleway_k8s_cluster" "kapsule" {
  name        = "kapsule-${var.env}"
  description = "${var.env} cluster"
  version     = var.kapsule_cluster_version
  cni         = var.cni
  tags        = [var.env]

  autoscaler_config {
    disable_scale_down              = var.disable_scale_down
    scale_down_delay_after_add      = var.scale_down_delay_after_add
    estimator                       = var.autoscaler_config_estimator
    expander                        = var.autoscaler_config_expander
    ignore_daemonsets_utilization   = var.ignore_daemonsets_utilization
    balance_similar_node_groups     = var.balance_similar_node_groups
    expendable_pods_priority_cutoff = var.expendable_pods_priority_cutoff
  }

  auto_upgrade {
    enable                        = var.auto_upgrade_enable
    maintenance_window_start_hour = var.maintenance_window_start_hour
    maintenance_window_day        = var.maintenance_window_day
  }
}

resource "scaleway_k8s_pool" "kapsule" {
  cluster_id  = scaleway_k8s_cluster.kapsule.id
  name        = "kapsule-${var.env}"
  node_type   = var.kapsule_pool_node_type
  size        = var.kapsule_pool_size
  autoscaling = var.autoscaling
  autohealing = var.autohealing
  min_size    = var.kapsule_pool_min_size
  max_size    = var.kapsule_pool_max_size
}
