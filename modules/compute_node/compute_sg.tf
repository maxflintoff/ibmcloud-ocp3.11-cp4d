resource "ibm_security_group" "compute_sg" {
  name        = "compute.${var.domain}-sg"
  description = "compute security group for ${var.domain}"
}

resource "ibm_security_group_rule" "compute_ssh" {
  direction         = "ingress"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
}

resource "ibm_security_group_rule" "compute_sdn" {
  direction         = "ingress"
  port_range_min    = 4789
  port_range_max    = 4789
  protocol          = "udp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_kubelet" {
  direction         = "ingress"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_https" {
  direction         = "ingress"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
}

resource "ibm_security_group_rule" "compute_http" {
  direction         = "ingress"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
}

#Allow Inbound to nodeport to access the app deployed on openshift.
resource "ibm_security_group_rule" "compute_nodeport" {
  direction         = "ingress"
  port_range_min    = "30000"
  port_range_max    = "32767"
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
}

resource "ibm_security_group_rule" "compute_portworx" {
  direction         = "ingress"
  port_range_min    = 9001
  port_range_max    = 9023
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_udp" {
  direction         = "ingress"
  port_range_min    = 9002
  port_range_max    = 9002
  protocol          = "udp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_lighthouse" {
  direction         = "ingress"
  port_range_min    = 32678
  port_range_max    = 32679
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_portmapper" {
  direction         = "ingress"
  port_range_min    = 111
  port_range_max    = 111
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_portmapper_udp" {
  direction         = "ingress"
  port_range_min    = 111
  port_range_max    = 111
  protocol          = "udp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_nfs" {
  direction         = "ingress"
  port_range_min    = 2049
  port_range_max    = 2049
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_nfs_udp" {
  direction         = "ingress"
  port_range_min    = 2049
  port_range_max    = 2049
  protocol          = "udp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_mountd" {
  direction         = "ingress"
  port_range_min    = 20048
  port_range_max    = 20048
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_mountd_udp" {
  direction         = "ingress"
  port_range_min    = 20048
  port_range_max    = 20048
  protocol          = "udp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_kvdb" {
  direction         = "ingress"
  port_range_min    = 6060
  port_range_max    = 6061
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_mountd_statd" {
  direction         = "ingress"
  port_range_min    = 9025
  port_range_max    = 9026
  protocol          = "tcp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "compute_portworx_lockd_udp" {
  direction         = "ingress"
  port_range_min    = 9024
  port_range_max    = 9024
  protocol          = "udp"
  security_group_id = ibm_security_group.compute_sg.id
  remote_ip         = var.public_subnet
}

resource "ibm_security_group_rule" "egress" {
  direction         = "egress"
  security_group_id = ibm_security_group.compute_sg.id
}