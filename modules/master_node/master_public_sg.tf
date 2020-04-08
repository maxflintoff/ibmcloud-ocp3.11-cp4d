resource "ibm_security_group" "master_public_sg" {
  name        = "master.${var.domain}-pub-sg"
  description = "Master public security group for ${var.domain}"
}

resource "ibm_security_group_rule" "master_public_ssh" {
  direction         = "ingress"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_public_https" {
  direction         = "ingress"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_public_http" {
  direction         = "ingress"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_public_api" {
  direction         = "ingress"
  port_range_min    = 8443
  port_range_max    = 8444
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_public_dns_tcp" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_public_sg.id
  remote_group_id   = var.worker_public_sg.id
}

resource "ibm_security_group_rule" "master_public_dns_udp" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "udp"
  security_group_id = ibm_security_group.master_public_sg.id
  remote_group_id   = var.worker_public_sg.id
}

resource "ibm_security_group_rule" "egress_public" {
  direction         = "egress"
  security_group_id = ibm_security_group.master_public_sg.id
}