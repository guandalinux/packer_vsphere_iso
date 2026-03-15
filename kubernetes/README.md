# Packer Vsphere ISO Ozitem

## Requirements
unset HISTFILE
export VAULT_ADDR=""
export VAULT_TOKEN=""


## Build template RKE2 Provider Custom

### System Compute

```bash
make build-rke-custom-compute
```

### System Storage

```bash
make build-rke-custom-storage
```


## Build template RKE2 Provider Vsphere

### System Compute

```bash
make build-rke-vsphere-compute
```
### System Storage

```bash
make build-rke-vsphere-storage
```

### Build All Custom
```bash
make -j 2 all-custom DEBIAN_VERSION=12
```

### Build All Vsphere
```bash
make -j 2 all-vsphere DEBIAN_VERSION=12
```