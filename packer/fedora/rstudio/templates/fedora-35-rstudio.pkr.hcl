variable "disk_size" {
  type    = string
  default = "10000"
}

variable "memory" {
  type    = string
  default = "8192"
}

variable "password" {
  type    = string
  default = "dabestpassword"
}

variable "user" {
  type    = string
  default = "fedora"
}

source "qemu" "example" {
  iso_url           = "https://download.fedoraproject.org/pub/fedora/linux/releases/35/Server/x86_64/iso/Fedora-Server-netinst-x86_64-35-1.2.iso"
  iso_checksum      = "sha256:dd35f955dd5a7054213a0098c6ee737ff116aa3090fc6dbfe89d424b5c3552dd"
  output_directory  = "build"
  shutdown_command  = "echo '${var.password}' | sudo -S shutdown -P now"
  disk_size         = "${var.disk_size}"
  format            = "qcow2"
  accelerator       = "kvm"
  http_directory    = "./http"
  ssh_username      = "${var.user}"
  ssh_password      = "${var.password}"
  #ssh_username      = "${var.user}"
  #ssh_password      = "${var.password}"
  ssh_timeout       = "10m"
  vm_name           = "fedora-35-rstudio.qcow2"
  net_device        = "virtio-net"
  disk_interface    = "virtio"
  boot_wait         = "1s"
  boot_command      = ["<tab> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  cpus		    = 8
  memory            = var.memory
  #qemu_img_args {
  #  create = [""]
  #}
}

build {
  sources = ["source.qemu.example"]

}
