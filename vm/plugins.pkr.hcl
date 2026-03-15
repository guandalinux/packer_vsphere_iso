//  BLOCK: packer
//  The Packer configuration.

packer {
  required_version = ">= 1.10.0"
  required_plugins {
    vsphere = {
      source  = "github.com/hashicorp/vsphere"
      version = ">= 1.3.0"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">= 1.1.0"
    }
    git = {
      source  = "github.com/ethanmdavidson/git"
      version = ">= 0.6.2"
    }
  }
}