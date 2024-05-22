# Les - 2

  
  
  

## opdracht - 1
> Deploy 1 Ubuntu VM en laat zien als output het ip adres van deze machine
  
```

output "vm_ip_address" {
  description = "IP Address of the created VM"
  value = [esxi_guest.vmtest.ip_address]

}

```

## opdracht - 2
> Deploy met Terraform 3 Ubuntu VM's

cloudimage gebruiken:


variables.tf

```
variable "ovf_file" {
  default = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.ova" 
}
```


Via cloudinit je public ssh-key op de vm's wordt gezet:

variables.tf

```
variable "public_key" {
  default = "AAAAC3NzaC1lZDI1NTE5AAAAIIHf8N6B5qFe8e/jFBB2MapsZknNJCb2ulawQqk/obc8"
}

variable "ssh_username" {
  default = "omarssh"
}

```

Via cloudinit de packages wget en ntpdate worden geinstalleerd:
zie userdata.yaml


Het ip adres van elke machine in een bestand op je beheer systeem komt:

```

resource "null_resource" "delay_provisioner" {
  depends_on = [esxi_guest.dbserver]
  
  provisioner "local-exec" {
    command = <<-EOT
      echo "${esxi_guest.dbserver[0].ip_address}" >> vm1_ip_address.txt
      echo "${esxi_guest.dbserver[1].ip_address}" >> vm2_ip_address.txt
      echo "${esxi_guest.dbserver[2].ip_address}" >> vm3_ip_address.txt
    EOT
  }
}
```
