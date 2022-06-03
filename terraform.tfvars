# Global
zone                           = "fr-par-1"
region                         = "fr-par"
env                            = "dev"


# Kapsule
/*
kapsule_cluster_version        = "1.22"
kapsule_pool_size              = 2
kapsule_pool_min_size          = 2
kapsule_pool_max_size          = 4
kapsule_pool_node_type         = "DEV1-M"
*/

#Database
/*
rdb_instance_node_type         = "db-gp-xs"
rdb_instance_engine            = "PostgreSQL-13"
rdb_is_ha_cluster              = true
rdb_disable_backup             = false
rdb_instance_volume_type       = "bssd"
rdb_instance_volume_size_in_gb = "50"
*/

#Should I keep varibales in TFVARS for module ??? Ask remy