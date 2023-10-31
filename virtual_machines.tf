resource "proxmox_virtual_environment_vm" "k8s_cp_01" {
  name        = "k8s-cp-01"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = "proxmox1"

  cpu {
    cores = 2
  }

  memory {
    dedicated = "4096"
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    # mac_address = "00:00:00:00:00:00" If you are re-running the terraform plan multiple times on the same network, use the same MAC addresses to prevent IP exhaustion
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image.id
    interface    = "scsi0"
    size         = "32"
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
     datastore_id      = "local-zfs"
     user_data_file_id = proxmox_virtual_environment_file.cloud_config.id    
    
     ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
resource "proxmox_virtual_environment_vm" "k8s_worker_01" {

  name        = "k8s-worker-01"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = "proxmox1"

  cpu {
    cores = 1
  }

  memory {
    dedicated = "4096"
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    # mac_address = "00:00:00:00:00:00" If you are re-running the terraform plan multiple times on the same network, use the same MAC addresses to prevent IP exhaustion
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image.id
    interface    = "scsi0"
    size         = "32"
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id      = "local-zfs"
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
resource "proxmox_virtual_environment_vm" "k8s_worker_02" {

  name        = "k8s-worker-02"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = "proxmox1"

  cpu {
    cores = 1
  }

  memory {
    dedicated = "4096"
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    # mac_address = "00:00:00:00:00:00" If you are re-running the terraform plan multiple times on the same network, use the same MAC addresses to prevent IP exhaustion
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image.id
    interface    = "scsi0"
    size         = "32"
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id      = "local-zfs"
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
resource "proxmox_virtual_environment_vm" "k8s_worker_03" {

  name        = "k8s-worker-03"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = "proxmox3"

  cpu {
    cores = 1
  }

  memory {
    dedicated = "6144"
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    # mac_address = "00:00:00:00:00:00" If you are re-running the terraform plan multiple times on the same network, use the same MAC addresses to prevent IP exhaustion
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image3.id
    interface    = "scsi0"
    size         = "32"
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id      = "local-zfs"
    user_data_file_id = proxmox_virtual_environment_file.cloud_config3.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
resource "proxmox_virtual_environment_vm" "k8s_worker_04" {

  name        = "k8s-worker-04"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = "proxmox3"

  cpu {
    cores = 1
  }

  memory {
    dedicated = "6144"
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    # mac_address = "00:00:00:00:00:00" If you are re-running the terraform plan multiple times on the same network, use the same MAC addresses to prevent IP exhaustion
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image3.id
    interface    = "scsi0"
    size         = "32"
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id      = "local-zfs"
    user_data_file_id = proxmox_virtual_environment_file.cloud_config3.id

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
