# Global
zone                           = "fr-par-1"
region                         = "fr-par"
env                            = "dev"

# Instance
instance_size_in_gb            = 50
instance_type                  = "GP1-S"
instance_image                 = "ubuntu_focal"
volume_size_in_gb              = 30
volume_type                    = "l_ssd"
tags                           = ["terraform instance", "scw-instance"]


# Database
rdb_instance_node_type         = "db-gp-xs"
rdb_instance_engine            = "PostgreSQL-13"
rdb_is_ha_cluster              = true
rdb_disable_backup             = false
rdb_instance_volume_type       = "bssd"
rdb_instance_volume_size_in_gb = "50"
user_name                      = "root"
rdb_user_root_password         = "XXXXXXXX"
rdb_user_scaleway_db_password  = "XXXXXXXX"

# Kapsule
kapsule_cluster_version = "1.22"
kapsule_pool_size       = 2
kapsule_pool_min_size   = 2
kapsule_pool_max_size   = 4
kapsule_pool_node_type  = "GP1-S"
cni                     = "calico"

# LoadBalancer
lb_size          = "LB-S"
inbound_port     = "80"
forward_port     = "80"
forward_protocol = "http"

# VPC
public_gateway_dhcp = "192.168.1.0/24"
public_gateway_type = "VPC-GW-S"
bastion_port        = 2222