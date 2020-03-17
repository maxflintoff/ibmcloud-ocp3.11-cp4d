output "master_nodes" {
    value = ibm_compute_vm_instance.masters
}

locals {
    ips = [
        for host in ibm_compute_vm_instance.masters: {
            name = host.hostname,
            private_ip = host.ipv4_address_private,
            public_ip = host.ipv4_address
        }
    ]
}

output "ips" {
    value = local.ips
}