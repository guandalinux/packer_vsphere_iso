locals {
  // Vault Secret
  vcenter_user_password = vault("/kv/data/vsphere", "pwd_user_vcenter")
  vm_user_password      = vault("/kv/data/packer", "pwd_user_vm")
  ca_crt                = vault("/kv/data/packer/ca.crt", "ca")

  // DATA SOURCE
  data_source_content = {
    "/ks.cfg" = templatefile("${abspath(path.root)}/http/ks.pkrtpl.hcl", {
      username             = var.vm_user_name
      user_password        = local.vm_user_password
      additional_packages  = join(" ", var.additional_packages)
      partition            = templatefile("${abspath(path.root)}/http/partition-${var.rke2_provider_type}-${var.vm_system_type}.pkrtpl.hcl", {})
    })
  }

  // BOOT COMMAND
  boot_command = [
    "<esc><wait>",
    "install /cdrom/install.amd/vmlinuz ",
    "auto-install/enable=true ",
    "netcfg/disable_autoconfig=true ",
    "netcfg/get_domain=france.groupe.intra ",
    "netcfg/get_hostname=${var.vm_name} ",
    "net.ifnames=0 ",
    "netcfg/choose_interface=eth0 ",
    "netcfg/get_ipaddress=${var.vm_ip_address} ",
    "netcfg/get_netmask=${cidrnetmask("${var.vm_ip_address}/${var.vm_ip_netmask}")} <wait>",
    "netcfg/get_gateway=${var.vm_ip_gateway} ",
    "netcfg/get_nameservers=${join(" ", var.vm_dns_list)} ",
    "netcfg/confirm_static=true ",
    "debconf/frontend=noninteractive ",
    "grub-installer/bootdev=/dev/sda ",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg ",
    "<enter><wait>"
  ]

  // METADATA

  # Name ISO
  vm_iso_name = "${var.vm_iso_distro}-${var.vm_iso_version}-amd64-netinst.iso"

  # Full Name VM
  vm_date       = formatdate("YYYYMMDD-hhmm", timeadd(timestamp(), "1h"))
  vm_name_full  = "${var.vm_name}-${local.vm_date}"
  
  # Built info
  build_by          = "Built by: HashiCorp Packer ${packer.version}"
  build_date        = formatdate("YYYY-MM-DD hh:mm ZZZ", timeadd(timestamp(), "1h"))
  build_version     = data.git-repository.cwd.head
  
  # Description
  build_description = "Distro Version: ${var.vm_iso_distro} ${var.vm_iso_version}\nVersion: ${local.build_version}\nBuilt on: ${local.build_date}\n${local.build_by}"

  manifest_date   = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path   = "${path.cwd}/manifests/"
  manifest_output = "${local.manifest_path}${local.manifest_date}.json"
}