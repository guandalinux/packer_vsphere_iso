# VCenter Configuration
variable "vcenter_server" {
  description = "vCenter server address"
  type        = string
}
variable "vcenter_user_name" {
  description = "vCenter username"
  type        = string
}


# VSphere Configuration
variable "vsphere_datacenter" {
  type    = string
}
variable "vsphere_cluster" {
  type    = string
}
variable "vsphere_datastore" {
  type    = string
}
variable "vsphere_host" {
  type    = string
}
variable "vsphere_folder" {
  type    = string
}
variable "vsphere_library" {
  type    = string
}

# VM Configuration
variable "vm_name" {
  description = "VM name"
  type        = string
}
variable "vm_user_name" {
  description = "VM user name"
  type        = string
}
variable "vm_system_type" {
  description = "VM user name"
  type        = string
  default     = "compute"
}
variable "rke2_provider_type" {
  description = "VM user name"
  type        = string
  default     = "custom"
}


# VM Version
variable "vm_version" {
  type        = number
}
variable "vm_guest_os_type" {
  type        = string
}


# VM ISO
variable "vm_cdrom_type" {
  type    = string
}
variable "vm_iso_lun" {
  type    = string
}
variable "vm_iso_path" {
  type    = string
}
variable "vm_iso_distro" {
  type    = string
}
variable "vm_iso_version" {
  type    = string
}

# VM Network
variable "vm_network" {
  type        = string
}
variable "vm_network_card" {
  type        = string
}
variable "vm_ip_address" {
  description = "VM IP address"
  type        = string
}
variable "vm_ip_netmask" {
  description = "VM IP netmask (CIDR notation)"
  type        = number
  default     = 24
}
variable "vm_ip_gateway" {
  description = "VM IP gateway"
  type        = string
}
variable "vm_dns_list" {
  description = "List of DNS servers"
  type        = list(string)
}


# VM Disk
variable "vm_disk_controller_type" {
  description = "List of disk controller types"
  type        = list(string)
  default     = ["pvscsi", "pvscsi", "pvscsi"]
}
variable "vm_disk_config" {
  description = "Configuration for vSphere storage."
  type = map(object({
    disk_controller_index = number
    disk_size             = number
    disk_thin_provisioned = bool
  }))
  default = {
    0 = {
      disk_controller_index = 0
      disk_size             = 12288
      disk_thin_provisioned = true
    }
    1 = {
      disk_controller_index = 1
      disk_size             = 30720
      disk_thin_provisioned = true
    }
    2 = {
      disk_controller_index = 1
      disk_size             = 10240
      disk_thin_provisioned = true
    }
  }
}


# Packages Install
variable "additional_packages" {
  type    = list(string)
  default = []
  description = "Liste des paquets supplémentaires à installer"
}