output "worker_nodes" {
    value = ibm_compute_vm_instance.workers
}

locals {
    local_ips = [
        for host in ibm_compute_vm_instance.workers: {
            name = host.hostname,
            ip = host.ipv4_address_private
        }
    ]
    remote_ips = [
        for host in ibm_compute_vm_instance.workers: {
            name = host.hostname,
            ip = host.ipv4_address
        }
    ]
}

output "local_ips" {
    value = local.local_ips
}

output "remote_ips" {
    value = local.remote_ips
}