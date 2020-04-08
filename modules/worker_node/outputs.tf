output "worker_nodes" {
  value = ibm_compute_vm_instance.workers
}

locals {
  ips = [
    for host in ibm_compute_vm_instance.workers : {
      name       = host.hostname,
      private_ip = host.ipv4_address_private
      public_ip  = host.ipv4_address
    }
  ]
}

output "ips" {
  value = local.ips
}

output "security_group_public" {
  value = ibm_security_group.worker_public_sg
}

output "security_group_private" {
  value = ibm_security_group.worker_private_sg
}