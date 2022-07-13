
module "instance" {
  source              = "./module/instance"
  instance_size_in_gb = var.instance_size_in_gb
  instance_type       = var.instance_type
  instance_image      = var.instance_image
  volume_size_in_gb   = var.volume_size_in_gb
  volume_type         = var.volume_type
  tags                = var.tags
  private_network_id  = module.vpc.private_network_id
}

module "database" {
  source = "./module/database"

  rdb_instance_node_type         = var.rdb_instance_node_type
  rdb_instance_engine            = var.rdb_instance_engine
  rdb_is_ha_cluster              = var.rdb_is_ha_cluster
  rdb_disable_backup             = var.rdb_disable_backup
  rdb_instance_volume_type       = var.rdb_instance_volume_type
  rdb_instance_volume_size_in_gb = var.rdb_instance_volume_size_in_gb
  rdb_user_root_password         = var.rdb_user_root_password
  rdb_user_scaleway_db_password  = var.rdb_user_scaleway_db_password
  instance_ip_addr               = module.instance.instance_ip_addr
  private_network_id             = module.vpc.private_network_id
  user_name                      = var.user_name
  zone                           = var.zone
  region                         = var.region
  env                            = var.env
}

module "kapsule" {
  source = "./module/kapsule"

  kapsule_cluster_version = var.kapsule_cluster_version
  kapsule_pool_size       = var.kapsule_pool_size
  kapsule_pool_min_size   = var.kapsule_pool_min_size
  kapsule_pool_max_size   = var.kapsule_pool_max_size
  kapsule_pool_node_type  = var.kapsule_pool_node_type
  cni                     = var.cni
  zone                    = var.zone
  region                  = var.region
  env                     = var.env
}

module "loadbalancer" {
  source = "./module/loadbalancer"

  lb_size            = var.lb_size
  inbound_port       = var.inbound_port
  forward_port       = var.forward_port
  forward_protocol   = var.forward_protocol
  private_network_id = module.vpc.private_network_id
  zone               = var.zone
  region             = var.region
  env                = var.env
}

module "vpc" {
  source = "./module/vpc"

  public_gateway_dhcp = var.public_gateway_dhcp
  public_gateway_type = var.public_gateway_type
  bastion_port        = var.bastion_port
  zone                = var.zone
  region              = var.region
  env                 = var.env

}
