variable "libvirt_disk_path" {
  description = "path for libvirt pool"
  default     = "/home/YourUserNameHere/project/pool1"
}

variable "ssh_username" {
  description = "the ssh user to use"
  default     = "YourUserNameHere"
}

variable "ssh_private_key" {
  description = "the private key to use"
   default = "~/.ssh/id_rsa"
}

variable "cloud_image" {
  type = string
  description = "cloud image name"
}

variable "user_dir" {
  type = string
  description = "user runtime directory"
}

variable "image_repo" {
  type = string
  description = "source for cloud image"
}

variable "user_bridge" {
  type = string
  description = "network bridge for current user"
}
