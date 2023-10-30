# tf-plan-deploy-k8s-proxmox
Use Terraform to deploy virtual machines on Proxmox and provision them with cloud-init for setting up a Kubernetes cluster.

**Deploying Kubernetes Cluster on Proxmox**

This repository contains the scripts and instructions for deploying a Kubernetes cluster on Proxmox using Ansible and Kubespray initiated via a Terraform script.

**Prerequisites**

A Proxmox server with at least 3 nodes (1 master and 2 workers) and enough resources to run the cluster.
A Linux machine with Ansible, Python, Terraform, and Git installed.  I personally used a Windows Subsystem for Linux (WSL) machine.
SSH access to the Proxmox nodes and the ability to run commands as root.

**Steps:**

The below is a walk-through on what to configure after you've clone this repo using:
git clone https://github.com/ab17182/tf-plan-deploy-k8s-proxmox.git

**Using Terraform with Proxmox**

Terraform integrates with third-party services (such as Proxmox) through plugins called providers. There are several providers available for Proxmox. At the time of writing [Oct 2023] I found the bpg proxmox provider to be the most feature rich and stable. 
To get started you'll want to modify main.tf and then initialize terraform by kicking off terraform init.

Then you'll set the environment variables to define your logon info to Proxmox with an account that has machine creation rights.  For example:

To use the provider, we need to give it a username and password to access the Proxmox API. There are several ways to do this, but I prefer using environment variables. 
I use a tool called direnv to set the environment variables. With this tool, the environment variables are automatically set when I enter the terraform directory and removed when I leave. 
This ensures that the username and password is not exposed to other applications on my system. To use direnv, create a file called .envrc and add the following:

export PROXMOX_VE_USERNAME=root@pam
export PROXMOX_VE_PASSWORD=<your proxmox password>

Note: Since this file contains sensitive information you should avoid pushing it to a shared git repository. I recommend either adding it to .gitignore or using a tool like git-crypt to encrypt it.

Modify the files.tf to point to the locations of the cloud-init based Debain images along with the cloud-init files and where they should be stored.  I stored them on USB keys plugged into the 3 Proxmox nodes but could have used a Ceph pool instead.

Modify the virtual_machines.tf to define the VM's for the control plane and worker nodes.  I created and placed a single control plane and created 4 workers for the k8s cluster.

Edit the cloud-init/user-data.yaml so that the user, ssh keys, and password are defined.  You can also add any additional lines under the run parameter.

Edit ansible.tf to reflect the virtual_machine.tf VM definitions or leave as is if you didn't change the VM count.

Create an "ansible" directory, go into it and pull down kubespray using:
git submodule add https://github.com/kubernetes-sigs/kubespray

There's also an ansible.cfg in the ansible directory that can be modified although leaving it as default is fine.  It has the necessary kubespray directories added.

That's it! You can now run the following command in the root directory to bring up the virtual machines and deploy the Kuberentes cluster using "terraform apply".







References
[Deploying Kubernetes Cluster on Proxmox - Part 1]
[Deploying Kubernetes Cluster on Proxmox - Part 2]
