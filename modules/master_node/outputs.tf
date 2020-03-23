output "master_node" {
  value = ibm_compute_vm_instance.master
}

output "ips" {
  value = {
    "name"       = (ibm_compute_vm_instance.master.hostname)
    "private_ip" = (ibm_compute_vm_instance.master.ipv4_address_private)
    "public_ip"  = (ibm_compute_vm_instance.master.ipv4_address)
  }
}