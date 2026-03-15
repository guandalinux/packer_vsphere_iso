// VCenter
vcenter_server    = "vcenter.intra"
vcenter_user_name = "cpt.vcenter"

// VSphere
vsphere_datacenter = "Datacenter"
vsphere_cluster    = "Cluster"
vsphere_datastore  = "Datastore"
vsphere_host       = "srv_esxi"
vsphere_folder     = "Template/Kube"
vsphere_library    = "K8S - DEBIAN 12 - RKE2 VSPHERE"

// VM Config
vm_name        = "TPL-DEBIAN-12-RKE2-VSPHERE-COMPUTE"
vm_system_type = "compute"
vm_user_name   = "debian"
vm_destroy     = false
vm_export_mode = "template"

// RKE2 Provider Type
rke2_provider_type = "vsphere"

// Cloud Init
cloud_init_datasources = ["NoCloud", "None"]

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
vm_ip_address   = "10.0.0.3"
vm_ip_netmask   = 24
vm_ip_gateway   = "10.0.0.254"
vm_dns_list     = ["172.16.0.53"]

// VM Disk
vm_disk_controller_type = ["pvscsi"]
vm_disk_config          = {
  "0" = {
    disk_controller_index = 0
    disk_size             = 9216
    disk_thin_provisioned = true
  }
}

// Packages Install
additional_packages = [
  "atop",
  "apparmor",
  "apparmor-utils",
  "bash-completion",
  "bind9-utils",
  "ca-certificates",
  "cloud-init",
  "cloud-guest-utils",
  "cloud-image-utils",
  "cloud-initramfs-growroot",
  "curl",
  "dnsutils",
  "git",
  "gnupg",
  "iproute2",
  "lsof",
  "net-tools",
  "openssh-server",
  "open-iscsi",
  "open-vm-tools",
  "open-vm-tools-desktop",
  "ngrep",
  "parted",
  "perl",
  "python3-apt",
  "rsyslog",
  "tcpdump",
  "telnet",
  "traceroute",
  "tmux",
  "unzip",
  "wget",
  "vim"
]