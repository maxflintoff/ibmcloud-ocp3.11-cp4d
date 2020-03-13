resource "ibm_security_group" "worker_private_sg" {
    name = "worker.${var.domain}-private-sg"
    description = "Worker private security group for ${var.domain}"
}

resource "ibm_security_group_rule" "worker_sdn" {
    direction = "ingress"
    port_range_min = 4789
    port_range_max = 4789
    protocol = "udp"
    security_group_id = ibm_security_group.worker_private_sg.id
}

resource "ibm_security_group_rule" "worker_kubelet" {
    direction = "ingress"
    port_range_min = 10250
    port_range_max = 10250
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_private_sg.id
}

resource "ibm_security_group_rule" "worker_crio" {
    direction = "ingress"
    port_range_min = 10010
    port_range_max = 10010
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_private_sg.id
}

resource "ibm_security_group_rule" "worker_ssh" {
    direction = "ingress"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_private_sg.id
}

resource "ibm_security_group_rule" "egress" {
    direction = "egress"
    security_group_id = ibm_security_group.worker_private_sg.id
}



resource "ibm_security_group" "worker_public_sg" {
    name = "worker.${var.domain}-public-sg"  
    description = "Worker public security group for ${var.domain}"
}

resource "ibm_security_group_rule" "worker_kubelet_public" {
    direction = "ingress"
    port_range_min = 10250
    port_range_max = 10250
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "worker_ssh_public" {
    direction = "ingress"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = ibm_security_group.worker_public_sg.id
}

resource "ibm_security_group_rule" "egress_public" {
    direction = "egress"
    security_group_id = ibm_security_group.worker_public_sg.id
}