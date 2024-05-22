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

locals {
  templatevars = {
    public_key = var.public_key
    ssh_username = var.ssh_username
  }
}


resource "esxi_guest" "dbserver" {
  count	             = 1
  guest_name         = "haha-docker"
  disk_store         = var.disk_store
  numvcpus	         = 1
  memsize            = 2048
  ovf_source        = var.ovf_file
  network_interfaces {
     virtual_network = var.virtual_network
  }

  guestinfo = {
    "metadata"          = base64encode(templatefile("metadata.yaml", { 
      name = format("db%d", count.index + 1)
    }))
    "metadata.encoding" = "base64"
    "userdata"          = base64encode(templatefile("userdata.yaml", local.templatevars))
    "userdata.encoding" = "base64"
  }

  
}
resource "null_resource" "delay_provisioner" {
  depends_on = [esxi_guest.dbserver]
  
}


output "db_ip" {
  value = esxi_guest.dbserver[*].ip_address
}
