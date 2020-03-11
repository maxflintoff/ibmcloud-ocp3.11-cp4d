resource "ibm_security_group" "installer_sg" {
    name = "installer.${var.domain}=-sg"
    description = "Installer security group for ${var.domain}"
}

//TODO lock routes down to needed security groups

resource "ibm_security_group_rule" "inbound_ssh" {
    direction = "ingress"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = ibm_security_group.installer_sg.id
}

resource "ibm_security_group_rule" "egress" {
    direction = "egress"
    security_group_id = ibm_security_group.installer_sg.id
}