# Basic template for single OpenStack VM instance with 
# Cloud-Init Data being supplied via a rendered template.

# Create an OpenStack SSH Keypair
resource "openstack_compute_keypair_v2" "terraform" {
  name       = "terraform"
  public_key = file("${var.ssh_key_file}.pub")
}

# Create a Private RSA key
resource "tls_private_key" "os_instance" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

# Render the Private RSA Key as a local file id_rsa file and set permissions to 0600
resource "local_file" "os_instance-ssh-privkey" {
    content = tls_private_key.os_instance.private_key_pem
    filename = "${path.module}/os_instance-id_rsa"
    file_permission = "0600"
}

# Render the public key file also.
resource "local_file" "os_instance-ssh-pubkey" {
    content  = tls_private_key.os_instance.public_key_openssh
    filename = "${path.module}/os_instance-id_rsa.pub"
    file_permission = "0644"
}

output "os_instance_ssh_pubic_key" {
  value = tls_private_key.os_instance.public_key_openssh
}

output "os_instance_ssh_private_key" {
  value = tls_private_key.os_instance.private_key_pem
}

# Basic template for single OpenStack VM instance with 
# Cloud-Init Data being supplied via a rendered template.

data "template_file" "master_cloud_config" {
  template = "${file("${path.module}/templates/cloud-init.yaml.tpl")}"
  vars = {
    tf_ssh_privkey = "${tls_private_key.os_instance.private_key_pem}"
    tf_ssh_pubkey = "${tls_private_key.os_instance.public_key_openssh}"
  }
}

output "master_cloud_init" {
  value = "${data.template_file.master_cloud_config.rendered}"
}

resource "openstack_compute_instance_v2" "vm" {
  name            = var.os_name
  image_name      = var.image
  flavor_name     = var.flavor
  key_pair        = openstack_compute_keypair_v2.terraform.name
  security_groups = ["default"]
  network {
    name = var.network_name
  }
  user_data    = data.template_file.master_cloud_config.rendered
}
