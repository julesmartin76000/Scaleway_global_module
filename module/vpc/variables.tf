variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "public_gateway_dhcp" {
  type = string
}

variable "public_gateway_type" {
  type = string
}

variable "dhcp_push_default_route" {
  type    = bool
  default = true
}

variable "bastion_enabled" {
  type    = bool
  default = true
}

variable "bastion_port" {
  type = number
}

variable "cleanup_dhcp" {
  type    = bool
  default = true
}

variable "enable_masquerade" {
  type    = bool
  default = true
}
