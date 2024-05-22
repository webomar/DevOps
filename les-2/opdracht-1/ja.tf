terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }
}

provider "esxi" {
  esxi_hostname      = "192.168.1.227" #vul hier jouw ESXi IP nummer in
  esxi_hostport      = "22"
  esxi_hostssl       = "443"
  esxi_username      = "root"
  esxi_password      = "Welkom01!"
}

resource "esxi_guest" "vmtest" {
  guest_name         = "vmtest"
  disk_store         = "DS-1"

  ovf_source = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.ova"

  memsize    = "1024"
  numvcpus   = "1"

  network_interfaces {
    virtual_network = "VM Network"
  }
}

output "vm_ip_address" {
  description = "IP Address of the created VM"
  value = [esxi_guest.vmtest.ip_address]

}
