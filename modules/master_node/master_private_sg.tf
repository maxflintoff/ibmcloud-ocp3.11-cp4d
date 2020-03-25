resource "ibm_security_group" "master_private_sg" {
  name        = "master.${var.domain}-pri-sg"
  description = "Master private security group for ${var.domain}"
}

resource "ibm_security_group_rule" "master_private_ssh" {
  direction         = "ingress"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_https" {
  direction         = "ingress"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_http" {
  direction         = "ingress"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_dns_8053" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_dns_8053_udp" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "udp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_dns" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_dns_udp" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "udp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_etcd" {
  direction         = "ingress"
  port_range_min    = 2379
  port_range_max    = 2380
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_worker_sdn" {
  direction         = "ingress"
  port_range_min    = 4789
  port_range_max    = 4789
  protocol          = "udp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_nfs_tcp" {
  direction         = "ingress"
  port_range_min    = 2049
  port_range_max    = 2049
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_nfs_udp" {
  direction         = "ingress"
  port_range_min    = 2049
  port_range_max    = 2049
  protocol          = "udp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_elasticsearch_cluster" {
  direction         = "ingress"
  port_range_min    = 9200
  port_range_max    = 9200
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_router_stats" {
  direction         = "ingress"
  port_range_min    = 1936
  port_range_max    = 1936
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_api" {
  direction         = "ingress"
  port_range_min    = 8443
  port_range_max    = 8444
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_kubelet" {
  direction         = "ingress"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_elasticsearch" {
  direction         = "ingress"
  port_range_min    = 9200
  port_range_max    = 9200
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_prometheus" {
  direction         = "ingress"
  port_range_min    = 9090
  port_range_max    = 9090
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "master_private_prometheus_exporter" {
  direction         = "ingress"
  port_range_min    = 9100
  port_range_max    = 9100
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_private_sg.id
}

resource "ibm_security_group_rule" "egress_private" {
  direction         = "egress"
  security_group_id = ibm_security_group.master_private_sg.id
}