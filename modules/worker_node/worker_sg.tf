resource "ibm_security_group" "worker_sg" {
    name = "worker.${var.domain}-sg"
    description = "Worker security group for ${var.domain}"
}

resource "ibm_security_group_rule" "worker_ssh" {
    direction = "ingress"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "worker_sdn" {
    direction = "ingress"
    port_range_min = 4789
    port_range_max = 4789
    protocol = "udp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "worker_kubelet" {
    direction = "ingress"
    port_range_min = 10250
    port_range_max = 10250
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "worker_crio" {
    direction = "ingress"
    port_range_min = 10010
    port_range_max = 10010
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "worker_portworx" {
    direction = "ingress"
    port_range_min = 9001
    port_range_max = 9022
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "worker_portworx_udp" {
    direction = "ingress"
    port_range_min = 9002
    port_range_max = 9002
    protocol = "udp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "worker_portworx_lighthouse" {
    direction = "ingress"
    port_range_min = 32678
    port_range_max = 32679
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_sg.id
}

resource "ibm_security_group_rule" "egress" {
    direction = "egress"
    security_group_id = ibm_security_group.worker_sg.id
}