# Create a volume for Attached Storage
resource "openstack_blockstorage_volume_v2" "myvol" {
  name = "tf_vol_1"
  size = 10
}

# Create a Virtual Machine Instance 
resource "openstack_compute_instance_v2" "vm" {
  count           = "${var.count}
  name            = "test_instance_${count.index}"
  image_name      = "${var.image}"
  flavor_name     = "${var.flavor}"
  key_pair        = "${var.openstack_ssh_keypair"
  security_groups = ["default","input_SSH"]
  user_data       = "#cloud-config\nssh_pwauth: True\npassword: ubuntu\ntimezone: Europe/Paris"
 
  network {
    name = "rakDE"
  }
}

# Attach Storage to Instance 
resource "openstack_compute_volume_attach_v2" "attached" {
  instance_id = "${openstack_compute_instance_v2.myinstance.id}"
  volume_id = "${openstack_blockstorage_volume_v2.myvol.id}"
}
