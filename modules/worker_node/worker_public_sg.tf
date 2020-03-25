resource "ibm_security_group" "worker_public_sg" {
  name        = "worker.${var.domain}-pub-sg"
  description = "Master public security group for ${var.domain}"
}

resource "ibm_security_group_rule" "worker_public_ssh" {
  direction         = "ingress"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "worker_public_https" {
  direction         = "ingress"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "worker_public_http" {
  direction         = "ingress"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

#Allow Inbound to nodeport to access the app deployed on openshift.
resource "ibm_security_group_rule" "worker_public_nodeport" {
  direction         = "ingress"
  port_range_min    = "30000"
  port_range_max    = "32767"
  protocol          = "tcp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "worker_public_portworx" {
  direction         = "ingress"
  port_range_min    = 9001
  port_range_max    = 9022
  protocol          = "tcp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "worker_public_portworx_udp" {
  direction         = "ingress"
  port_range_min    = 9002
  port_range_max    = 9002
  protocol          = "udp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "worker_public_portworx_lighthouse" {
  direction         = "ingress"
  port_range_min    = 32678
  port_range_max    = 32679
  protocol          = "tcp"
  security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "egress_public" {
  direction         = "egress"
  security_group_id = ibm_security_group.worker_public_sg.id
}