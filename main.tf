module "centos-7-aarch64-GenericCloud-1708-qcow2" {
  source  = "./single-vm"
  image   = "centos-7-aarch64-GenericCloud-1708-qcow2"
  os_name = "centos7"
}

module "centos-8-aarch64-GenericCloud-qcow2" {
  source       = "./single-vm"
  image  = "centos-8-aarch64-GenericCloud-qcow2"
  os_name = "centos8"
}

module "debian-9-openstack-arm64-qcow2" {
  source       = "./single-vm"
  image  = "debian-9-openstack-arm64-qcow2"
  os_name = "debian9"
}

module "debian-10-openstack-arm64-qcow2" {
  source       = "./single-vm"
  image  = "debian-10-openstack-arm64-qcow2"
  os_name = "debian10"
}

module "flatcar_current_alpha_arm64_qcow2" {
  source       = "./single-vm"
  image  = "flatcar_current_alpha_arm64_qcow2"
  os_name = "flatcarLinux"
}

