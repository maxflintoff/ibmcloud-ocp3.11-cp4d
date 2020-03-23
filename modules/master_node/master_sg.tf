resource "ibm_security_group" "master_sg" {
  name        = "master.${var.domain}-sg"
  description = "Master security group for ${var.domain}"
}

resource "ibm_security_group_rule" "master_ssh" {
  direction         = "ingress"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_https" {
  direction         = "ingress"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_http" {
  direction         = "ingress"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_dns_8053" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_dns_8053_udp" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_dns" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_dns_udp" {
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_etcd" {
  direction         = "ingress"
  port_range_min    = 2379
  port_range_max    = 2380
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_worker_sdn" {
  direction         = "ingress"
  port_range_min    = 4789
  port_range_max    = 4789
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_nfs_tcp" {
  direction         = "ingress"
  port_range_min    = 2049
  port_range_max    = 2049
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_nfs_udp" {
  direction         = "ingress"
  port_range_min    = 2049
  port_range_max    = 2049
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_elasticsearch_cluster" {
  direction         = "ingress"
  port_range_min    = 9200
  port_range_max    = 9200
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_router_stats" {
  direction         = "ingress"
  port_range_min    = 1936
  port_range_max    = 1936
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_api" {
  direction         = "ingress"
  port_range_min    = 8443
  port_range_max    = 8444
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_kubelet" {
  direction         = "ingress"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_elasticsearch" {
  direction         = "ingress"
  port_range_min    = 9200
  port_range_max    = 9200
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_prometheus" {
  direction         = "ingress"
  port_range_min    = 9090
  port_range_max    = 9090
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_prometheus_exporter" {
  direction         = "ingress"
  port_range_min    = 9100
  port_range_max    = 9100
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "worker_portworx" {
  direction         = "ingress"
  port_range_min    = 9001
  port_range_max    = 9022
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "worker_portworx_udp" {
  direction         = "ingress"
  port_range_min    = 9002
  port_range_max    = 9002
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "worker_portworx_lighthouse" {
  direction         = "ingress"
  port_range_min    = 32678
  port_range_max    = 32679
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "egress" {
  direction         = "egress"
  security_group_id = ibm_security_group.master_sg.id
}