output "compute_nodes" {
  value = ibm_compute_vm_instance.computes
}

locals {
  ips = [
    for host in ibm_compute_vm_instance.computes : {
      name       = host.hostname,
      private_ip = host.ipv4_address_private
      public_ip  = host.ipv4_address
    }
  ]
}

output "ips" {
  value = local.ips
}

output "security_group" {
  value = ibm_security_group.compute_sg
}