variable "instance_type" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "instance_size_in_gb" {
  type = number
}

variable "volume_size_in_gb" {
  type = number
}

variable "volume_type" {
  type = string
}

variable "private_network_id" {
  type = string
}

variable "tags" {
  type = list(any)
}
