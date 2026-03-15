/*
    DESCRIPTION:
    Debian 12 build definition.
    Packer Plugin for VMware vSphere: 'vsphere-iso' builder.
*/


// BLOCK: data
data "git-repository" "cwd" {}

//  BLOCK: source
//  Defines the builder configuration blocks.

source "vsphere-iso" "virtual-machine" {

  // vCenter Server Endpoint Settings and Credentials
  vcenter_server      = var.vcenter_server
  username            = var.vcenter_user_name
  password            = local.vcenter_user_password
  insecure_connection = false

  // vSphere Settings
  datacenter = var.vsphere_datacenter
  cluster    = var.vsphere_cluster
  datastore  = var.vsphere_datastore
  host       = var.vsphere_host
  folder     = var.vsphere_folder

  // Virtual Machine Settings

  # BASE
  vm_name  = var.vm_name
  notes    = local.build_description
  firmware = "bios"
  destroy  = true

  # VERSION
  vm_version    = var.vm_version
  guest_os_type = var.vm_guest_os_type

  # CPU
  CPUs         = 1
  cpu_cores    = 1
  CPU_hot_plug = true

  # RAM
  RAM          = 1024
  RAM_hot_plug = true

  # DISK
  disk_controller_type = var.vm_disk_controller_type
  dynamic "storage" {
    for_each = var.vm_disk_config
      content {
        disk_controller_index = storage.value.disk_controller_index
        disk_size             = storage.value.disk_size
        disk_thin_provisioned = storage.value.disk_thin_provisioned
      }
  }

  # NETWORK
  network_adapters {
    network      = var.vm_network
    network_card = var.vm_network_card
  }
  remove_network_adapter = true
  
  # CDROM
  cdrom_type = var.vm_cdrom_type
  iso_paths  = [
    "[${var.vm_iso_lun}] ${var.vm_iso_path}${local.vm_iso_name}"
  ]
  remove_cdrom    = true

  # VMWARE TOOLS
  configuration_parameters = {
    "isolation.tools.paste.disable"        = "FALSE"
    "isolation.tools.copy.disable"         = "FALSE"
    "isolation.tools.SetGUIOptions.enable" = "TRUE"
  }

  tools_upgrade_policy = true
  tools_sync_time      = true

  # Boot and Provisioning Settings
  http_content           = local.data_source_content
  http_port_min          = 8000
  http_port_max          = 8010
  boot_order             = "-"
  boot_wait              = "5s"
  boot_command           = local.boot_command
  boot_keygroup_interval = "10ms"

  # IP TIMEOUT
  ip_wait_timeout   = "20m"
  ip_settle_timeout = "5s"

  # SSH
  ssh_username = var.vm_user_name
  ssh_password = local.vm_user_password

  # # CONVERT VM TO TEMPLATE
  # convert_to_template = true

  content_library_destination {
    name        = local.vm_name_full
    library     = var.vsphere_library
    description = local.build_description
    ovf         = true
  }
}


//  BLOCK: build
//  Defines the builders to run, provisioners, and post-processors.

build {
  sources = ["source.vsphere-iso.virtual-machine"]

  # ANSIBLE PLAYBOOK
  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
    user = var.vm_user_name
    ansible_env_vars = [
      "ANSIBLE_SSH_PASS=${local.vm_user_password}",
      "ANSIBLE_BECOME_PASS=${local.vm_user_password}",
      "CA_CERT=${local.ca_crt}"
    ]
  }
}