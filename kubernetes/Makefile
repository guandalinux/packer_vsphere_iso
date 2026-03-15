# Makefile

# Vérification que la version est bien fournie
ifndef DEBIAN_VERSION
$(error Vous devez spécifier la version via DEBIAN_VERSION=xx)
endif

# Définir la commande Packer
PACKER_VALIDATE = packer validate
PACKER_BUILD = packer build --force --on-error=ask

# VALIDATE PACKER

validate:
	@echo "Validating template vm base configuration..."
	$(PACKER_VALIDATE) .

# BUILD PACKER

build-rke-custom-compute:
	@echo "Building RKE2 Custom Compute (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/rke2-custom/compute.pkrvars.hcl" .

build-rke-custom-storage:
	@echo "Building RKE2 Custom Storage (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/rke2-custom/storage.pkrvars.hcl" .

build-rke-vsphere-compute:
	@echo "Building RKE2 Vsphere Compute (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/rke2-vsphere/compute.pkrvars.hcl" .

build-rke-vsphere-storage:
	@echo "Building RKE2 Vsphere Storage (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/rke2-vsphere/storage.pkrvars.hcl" .

all-custom: build-rke-custom-compute build-rke-custom-storage
all-vsphere: build-rke-vsphere-compute build-rke-vsphere-storage
all: build-rke-custom-compute build-rke-custom-storage build-rke-vsphere-compute build-rke-vsphere-storage