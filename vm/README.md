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

### Build ALL

```bash
make -j 3 build-all DEBIAN_VERSION=12
```