# packer_vsphere_iso

## Acknowledgments

Inspired by [packer-examples-for-vsphere](https://github.com/vmware/packer-examples-for-vsphere)
by VMware, Inc. — licensed under BSD-2-Clause.

## Kubernetes

Build OVF Debian to RKE2 Custom :
- Compute : No storage
- Storage : Storage with Longhorn

Build Template Debian to RKE2 Vsphere :
- Compute : No storage
- Storage : Storage with Longhorn

### Partition LVM

#### RKE CUSTOM
![partition_lvm_vm](assets/partition_lvm_k8s_rke2_custom.png)

#### RKE VSPHERE
![partition_lvm_vm](assets/partition_lvm_k8s_rke2_vsphere.png)


## VM

Build OVF Debian for VM :
- APP+DB : server with application + databases
- APP    : server with application
- DB     : server with databases


### Partition LVM

![partition_lvm_vm](assets/partition_lvm_vm.png)