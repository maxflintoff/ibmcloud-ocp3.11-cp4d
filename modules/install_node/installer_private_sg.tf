resource "ibm_security_group" "installer_private_sg" {
  name        = "installer.${var.domain}-private-sg"
  description = "Installer security group for ${var.domain}"
}

resource "ibm_security_group_rule" "inbound_dns" {
  direction         = "ingress"
  port_range_min    = 53
  port_range_max    = 53
  protocol          = "tcp"
  security_group_id = ibm_security_group.installer_private_sg.id
}

resource "ibm_security_group_rule" "inbound_dns_udp" {
  direction         = "ingress"
  port_range_min    = 53
  port_range_max    = 53
  protocol          = "udp"
  security_group_id = ibm_security_group.installer_private_sg.id
}

resource "ibm_security_group_rule" "inbound_icmp" {
  direction         = "ingress"
  protocol          = "icmp"
  security_group_id = ibm_security_group.installer_private_sg.id
}

resource "ibm_security_group_rule" "egress_private" {
  direction         = "egress"
  security_group_id = ibm_security_group.installer_private_sg.id
}