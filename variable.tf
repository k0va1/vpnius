variable "do_token" {
  type = string
  description = "Digital Ocean token"
}

variable "region" {
  type = string
  description = "Project region"
  default = "ams3"
}

variable "image" {
  type = string
  description = "OS image"
  default = "ubuntu-22-10-x64"
}

variable "name" {
  type = string
  description = "Service name"
  default = "wireguard-vpn"
}

variable "size" {
  type = string
  description = "Droplet size"
  default = "s-1vcpu-1gb"
}
