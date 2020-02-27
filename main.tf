module "centos-7-aarch64-GenericCloud-1708-qcow2" {
  source       = "./single-vm"
  os_vm_image  = "centos-7-aarch64-GenericCloud-1708-qcow2"
  os_vm_flavor = "2"
}

module "centos-8-aarch64-GenericCloud-qcow2" {
  source       = "./single-vm"
  os_vm_image  = "centos-8-aarch64-GenericCloud-qcow2"
  os_vm_flavor = "2"
}

module "centos-7_1901-x86_64-qcow2" {
  source       = "./single-vm"
  os_vm_image  = "centos-7.1901-x86_64-qcow2"
  os_vm_flavor = "2"
}

module "debian-9-openstack-arm64-qcow2" {
  source       = "./single-vm"
  os_vm_image  = "debian-9-openstack-arm64-qcow2"
  os_vm_flavor = "2"
}

module "debian-10-openstack-arm64-qcow2" {
  source       = "./single-vm"
  os_vm_image  = "debian-10-openstack-arm64-qcow2"
  os_vm_flavor = "2"
}

module "flatcar_current_alpha_arm64_qcow2" {
  source       = "./single-vm"
  os_vm_image  = "flatcar_current_alpha_arm64_qcow2"
  os_vm_flavor = "2"
}

