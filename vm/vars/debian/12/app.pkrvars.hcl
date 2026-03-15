// VCenter
vcenter_server    = "vcenter.intra"
vcenter_user_name = "cpt.vcenter"

// VSphere
vsphere_datacenter = "Datacenter"
vsphere_cluster    = "Cluster"
vsphere_datastore  = "Datastore"
vsphere_host       = "srv_esxi"
vsphere_folder     = "Template/VM/DEBIAN/12"
vsphere_library    = "VM - DEBIAN 12 - APP"

// VM Config
vm_name        = "TPL-DEBIAN-12-VM-APP"
vm_system_type = "app"
vm_user_name   = "debian"

// VM Version
vm_version       = 19
vm_guest_os_type = "debian11_64Guest"

// VM ISO
vm_cdrom_type  = "ide"
vm_iso_lun     = "lun-iso"
vm_iso_path    = "iso/"
vm_iso_distro  = "debian"
vm_iso_version = "12.13.0"

// VM Network
vm_network      = "network"
vm_network_card = "card"
vm_ip_address   = "10.0.0.2"
vm_ip_netmask   = 24
vm_ip_gateway   = "10.0.0.254"
vm_dns_list     = ["172.16.0.53"]

// VM Disk
vm_disk_controller_type = ["pvscsi", "pvscsi", "pvscsi"]
vm_disk_config          = {
  "0" = {
    disk_controller_index = 0
    disk_size             = 7168
    disk_thin_provisioned = true
  }
  "1" = {
    disk_controller_index = 1
    disk_size             = 1024
    disk_thin_provisioned = true
  }
  "2" = {
    disk_controller_index = 2
    disk_size             = 2048
    disk_thin_provisioned = true
  }
}

// Packages Install
additional_packages = [
  "atop",
  "bash-completion",
  "bind9-utils",
  "ca-certificates",
  "cloud-init",
  "curl",
  "dnsutils",
  "git",
  "gnupg",
  "iproute2",
  "lsof",
  "net-tools",
  "openssh-server",
  "open-vm-tools",
  "open-vm-tools-desktop",
  "ngrep",
  "parted",
  "perl",
  "python3-apt",
  "rsyslog",
  "tcpdump",
  "telnet",
  "tmux",
  "traceroute",
  "unzip",
  "wget",
  "vim"
]