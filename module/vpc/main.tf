# Private Network creation
resource "scaleway_vpc_private_network" "scaleway_pn" {
  name = "${var.env}-private_network"
}
## DHCP
resource "scaleway_vpc_public_gateway_dhcp" "scaleway_dhcp" {
  subnet             = var.public_gateway_dhcp
  push_default_route = var.dhcp_push_default_route
}

# Public Gateway
resource "scaleway_vpc_public_gateway_ip" "scaleway" {
}

resource "scaleway_vpc_public_gateway" "scaleway_pg" {
  name            = "${var.env}-public_gateway"
  type            = var.public_gateway_type
  ip_id           = scaleway_vpc_public_gateway_ip.scaleway.id
  bastion_enabled = var.bastion_enabled
  bastion_port    = var.bastion_port
}

# Routing
resource "scaleway_vpc_gateway_network" "scaleway" {
  gateway_id         = scaleway_vpc_public_gateway.scaleway_pg.id
  private_network_id = scaleway_vpc_private_network.scaleway_pn.id
  dhcp_id            = scaleway_vpc_public_gateway_dhcp.scaleway_dhcp.id
  cleanup_dhcp       = var.cleanup_dhcp
  enable_masquerade  = var.enable_masquerade
  depends_on         = [scaleway_vpc_public_gateway.scaleway_pg, scaleway_vpc_public_gateway_ip.scaleway, scaleway_vpc_private_network.scaleway_pn]
}
