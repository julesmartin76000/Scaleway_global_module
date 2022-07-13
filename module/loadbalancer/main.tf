resource "scaleway_lb_ip" "scaleway_lb" {
}

resource "scaleway_lb" "scaleway_lb" {
  ip_id = scaleway_lb_ip.scaleway_lb.id
  type  = var.lb_size
  private_network {
    private_network_id = var.private_network_id
    dhcp_config        = true
  }

  #depends_on = [scaleway_vpc_public_gateway.main]
}

#frontend
resource "scaleway_lb_frontend" "scaleway_lb" {
  lb_id        = scaleway_lb.scaleway_lb.id
  backend_id   = scaleway_lb_backend.scaleway_lb.id
  name         = "${var.env}-frontend"
  inbound_port = var.inbound_port
}

#backend
resource "scaleway_lb_backend" "scaleway_lb" {
  lb_id            = scaleway_lb.scaleway_lb.id
  name             = "${var.env}-backend"
  forward_protocol = var.forward_protocol
  forward_port     = var.forward_port
}
