resource "ibm_security_group" "master_public_sg" {
    name = "master.${var.domain}-public-sg"
    description = "Master public security group for ${var.domain}"
}

resource "ibm_security_group_rule" "master_https_public" {
    direction = "ingress"
    port_range_min = 443
    port_range_max = 443
    protocol = "tcp"
    security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_http_public" {
    direction = "ingress"
    port_range_min = 80
    port_range_max = 80
    protocol = "tcp"
    security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_api_public" {
    direction = "ingress"
    port_range_min = 8443
    port_range_max = 8444
    protocol = "tcp"
    security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_kubelet_public" {
    direction = "ingress"
    port_range_min = 10250
    port_range_max = 10250
    protocol = "tcp"
    security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_prometheus_public" {
    direction = "ingress"
    port_range_min = 9090
    port_range_max = 9090
    protocol = "tcp"
    security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "master_ssh_public" {
    direction = "ingress"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    security_group_id = ibm_security_group.master_public_sg.id
}

resource "ibm_security_group_rule" "egress_public" {
    direction = "egress"
    security_group_id = ibm_security_group.master_public_sg.id
}