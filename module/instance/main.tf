resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "scw-instance" {
  size_in_gb = var.volume_size_in_gb
  type       = var.volume_type
}

resource "scaleway_instance_server" "scw-instance" {
  type  = var.instance_type
  image = var.instance_image

  tags  = var.tags
  ip_id = scaleway_instance_ip.public_ip.id


  additional_volume_ids = [scaleway_instance_volume.scw-instance.id]

  root_volume {
    # The local storage of a DEV1-L instance is 80 GB, subtract 30 GB from the additional l_ssd volume,
    # then the root volume needs to be 50 GB.
    size_in_gb = var.instance_size_in_gb
  }

  private_network {
    pn_id = var.private_network_id
  }
}
