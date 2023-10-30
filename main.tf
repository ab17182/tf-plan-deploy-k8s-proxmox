terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.35.1"
    }
  }
}

provider "proxmox" {
    endpoint = "https://[your_proxmox_server]:8006/"
    insecure = "true"
}
