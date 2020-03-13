resource "ibm_security_group" "installer_public_sg" {
    name = "installer.${var.domain}-public-sg"
    description = "Installer public security group for ${var.domain}"
}

resource "ibm_security_group_rule" "inbound_ssh_public" {
    direction = "ingress"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = ibm_security_group.installer_public_sg.id
}

resource "ibm_security_group_rule" "egress_public" {
    direction = "egress"
    security_group_id = ibm_security_group.installer_public_sg.id
}