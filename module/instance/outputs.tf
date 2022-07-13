output "instance_ip_addr" {
  value = "${scaleway_instance_ip.public_ip.address}/32"
}
