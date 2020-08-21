output "infra_node" {
  value = ibm_compute_vm_instance.infra
}

locals {
  ips = [
    for host in ibm_compute_vm_instance.infra : {
      name       = host.hostname,
      private_ip = host.ipv4_address_private
      public_ip  = host.ipv4_address
    }
  ]
}

output "ips" {
  value = local.ips
}