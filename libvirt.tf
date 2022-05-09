terraform {
  required_version = ">= 1.0.8"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

provider "libvirt" {
   uri = "qemu:///session?socket=${var.user_dir}/libvirt/virtqemud-sock"
}

resource "libvirt_pool" "terra_pool" {
  name = "terra_pool"
  type = "dir"
  path = var.libvirt_disk_path
}

module "vm" {
  source  = "MonolithProjects/vm/libvirt"
  version = "1.9.1"

  vm_hostname_prefix = "server"
  vm_count    		= 1
  memory      		= "512"
  vcpu        		= 1
  pool 	      		= libvirt_pool.terra_pool.name
  bridge      		= var.user_bridge
  dhcp        		= true
  local_admin 		= var.ssh_username
  ssh_admin   		= var.ssh_username
  ssh_private_key 	= "~/.ssh/id_rsa"
  local_admin_passwd 	= "StrongPassword"
  ssh_keys    = [
    "ssh-rsa "
    ]
  os_img_url = "${var.image_repo}/${var.cloud_image}"
}

output "ip_address" {
  value = module.vm.ip_address[0]
}
