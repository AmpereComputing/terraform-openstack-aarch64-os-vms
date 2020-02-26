variable "region" {
  description = "The the OpenStack region to deploy the network into."
  default = "RegionOne"
}

variable "image" {
  description = "The the OpenStack VM Image to default to when starting multiple virtual machines with terraform"
  default  = "RancherOS"
}

variable "flavor" {
  description = "The the OpenStack VM flavor to default to when starting multiple virtual machines with terraform"
  default = "Tiny"
}

variable "ssh_key_file" {
  default = "~/.ssh/id_rsa"
}

variable "ssh_user_name" {
  default = "rancher"
}

variable "pool" {
  default = "ext-net"
}

variable "count" {
  default = 2
}

variable "network_name" {
  default = "cpd-dev-network-1"
}

variable "instance_prefix" {
  default = "os-vm"
}
