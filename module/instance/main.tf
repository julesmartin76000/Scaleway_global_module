resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "scw-instance" {
  size_in_gb = 30
  type       = "l_ssd"
}

resource "scaleway_instance_server" "scw-instance" {
  type  = "DEV1-L"
  image = "ubuntu_focal"

  tags = ["terraform instance", "scw-instance"]

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [scaleway_instance_volume.scw-instance.id]

  root_volume {
    # The local storage of a DEV1-L instance is 80 GB, subtract 30 GB from the additional l_ssd volume, then the root volume needs to be 50 GB.
    size_in_gb = 50
  }

  private_network {
    pn_id = var.private_network_id
  }
}
