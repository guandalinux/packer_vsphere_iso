# Makefile

# Vérification que la version est bien fournie
ifndef DEBIAN_VERSION
$(error Vous devez spécifier la version via DEBIAN_VERSION=xx)
endif

# Définir la commande Packer
PACKER_VALIDATE = packer validate
PACKER_BUILD = packer build --force --on-error=ask

# BUILD PACKER

build-vm-app-db:
	@echo "Building RKE2 Custom Compute (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/app-db.pkrvars.hcl" .

build-vm-app:
	@echo "Building RKE2 Custom Storage (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/app.pkrvars.hcl" .

build-vm-db:
	@echo "Building RKE2 Vsphere Compute (Debian $(DEBIAN_VERSION))..."
	$(PACKER_BUILD) -var-file="./vars/debian/$(DEBIAN_VERSION)/db.pkrvars.hcl" .

build-all: build-vm-app-db build-vm-app build-vm-db