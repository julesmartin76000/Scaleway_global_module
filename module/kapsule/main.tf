
resource "scaleway_k8s_cluster" "kapsule" {
  name = "kapsule-${var.env}"
  #description = "${var.env} cluster"
  version = var.kapsule_cluster_version
  cni     = var.cni
  tags    = [var.env]

  autoscaler_config {
    disable_scale_down              = false
    scale_down_delay_after_add      = "5m"
    estimator                       = "binpacking"
    expander                        = "random"
    ignore_daemonsets_utilization   = true
    balance_similar_node_groups     = true
    expendable_pods_priority_cutoff = -5
  }

  auto_upgrade {
    enable                        = true
    maintenance_window_start_hour = 4
    maintenance_window_day        = "sunday"
  }
}

resource "scaleway_k8s_pool" "kapsule" {
  cluster_id  = scaleway_k8s_cluster.kapsule.id
  name        = "kapsule-${var.env}"
  node_type   = var.kapsule_pool_node_type
  size        = var.kapsule_pool_size
  autoscaling = true
  autohealing = true
  min_size    = var.kapsule_pool_min_size
  max_size    = var.kapsule_pool_max_size
}
