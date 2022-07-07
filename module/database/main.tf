resource "scaleway_rdb_instance" "scaleway-rdb" {
  name              = "postgresql-${var.env}"
  node_type         = var.rdb_instance_node_type
  volume_type       = var.rdb_instance_volume_type
  engine            = var.rdb_instance_engine
  is_ha_cluster     = var.rdb_is_ha_cluster
  disable_backup    = var.rdb_disable_backup
  volume_size_in_gb = var.rdb_instance_volume_size_in_gb
  user_name         = var.user_name
  password          = var.rdb_user_root_password
  private_network {
    ip_net = "192.168.1.254/24" #pool high
    pn_id  = var.private_network_id
  }

}

resource "scaleway_rdb_database" "scaleway-rdb" {
  instance_id = scaleway_rdb_instance.scaleway-rdb.id
  name        = "${var.env}-database"
}

resource "scaleway_rdb_user" "scaleway-rdb" {
  instance_id = scaleway_rdb_instance.scaleway-rdb.id
  name        = "${var.env}-user-database"
  password    = var.rdb_user_scaleway_db_password
  is_admin    = false
}

resource "scaleway_rdb_acl" "scaleway-rdb" {
  instance_id = scaleway_rdb_instance.scaleway-rdb.id
  acl_rules {
    ip          = var.instance_ip_addr
    description = "SCW instance"
  }
}
