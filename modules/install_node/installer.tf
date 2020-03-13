resource "ibm_compute_vm_instance" "installer" {
    hostname = var.hostname
    domain = var.domain
    flavor_key_name = var.flavor
    os_reference_code = var.os
    datacenter = var.datacenter
    network_speed = 1000
    ssh_key_ids = var.ssh_id
    local_disk = false
    tags = var.tags
    private_security_group_ids = [ ibm_security_group.installer_private_sg.id ]
    public_security_group_ids = [ ibm_security_group.installer_public_sg.id ]
}

resource "null_resource" "copy_private_key" {
    provisioner "file" {
        content = var.ssh_key.private_key_pem
        destination = "/root/.ssh/id_rsa"

        connection {
            type = "ssh"
            user = "root"
            host = ibm_compute_vm_instance.installer.ipv4_address
            private_key = var.ssh_key.private_key_pem
        }
    }
}