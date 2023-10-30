terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.35.1"
    }
  }
}

provider "proxmox" {
    endpoint = "https://172.16.0.174:8006/"
    insecure = "true"
}
