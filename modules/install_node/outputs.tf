output "installer_node" {
    value = ibm_compute_vm_instance.installer.ipv4_address
}

output "local_ips" {
    value = {
        "name" = (ibm_compute_vm_instance.installer.hostname)
        "ip" = (ibm_compute_vm_instance.installer.ipv4_address_private)
    }
}