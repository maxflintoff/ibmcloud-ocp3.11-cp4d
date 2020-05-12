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

resource "ibm_security_group_rule" "master_sdn_self" {
  count             = length(ibm_compute_vm_instance.master)
  direction         = "ingress"
  port_range_min    = 4789
  port_range_max    = 4789
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = ibm_compute_vm_instance.master[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_sdn_lb" {
  count             = length(var.lb)
  direction         = "ingress"
  port_range_min    = 4789
  port_range_max    = 4789
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.lb[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_sdn_worker" {
  count             = length(var.worker)
  direction         = "ingress"
  port_range_min    = 4789
  port_range_max    = 4789
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.worker[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_etcd" {
  count             = length(var.worker)
  direction         = "ingress"
  port_range_min    = 2379
  port_range_max    = 2379
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.worker[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_etcd_self" {
  count             = length(ibm_compute_vm_instance.master)
  direction         = "ingress"
  port_range_min    = 2379
  port_range_max    = 2380
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = ibm_compute_vm_instance.master[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_etcd_lb" {
  count             = length(var.lb)
  direction         = "ingress"
  port_range_min    = 2379
  port_range_max    = 2380
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.lb[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_api_metrics" {
  direction         = "ingress"
  port_range_min    = 8443
  port_range_max    = 8444
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_dns_tcp" {
  count             = length(var.worker)
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.worker[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_dns_udp" {
  count             = length(var.worker)
  direction         = "ingress"
  port_range_min    = 8053
  port_range_max    = 8053
  protocol          = "udp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.worker[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_kubelet" {
  count             = length(var.worker)
  direction         = "ingress"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.worker[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_kubelet_self" {
  count             = length(ibm_compute_vm_instance.master)
  direction         = "ingress"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = ibm_compute_vm_instance.master[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_kubelet_lb" {
  count             = length(var.lb)
  direction         = "ingress"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
  remote_ip         = var.lb[count.index].ipv4_address
}

resource "ibm_security_group_rule" "master_https" {
  count             = length(var.lb) > 0 ? 0 : 1
  direction         = "ingress"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "master_http" {
  count             = length(var.lb) > 0 ? 0 : 1
  direction         = "ingress"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  security_group_id = ibm_security_group.master_sg.id
}

resource "ibm_security_group_rule" "egress_public" {
  direction         = "egress"
  security_group_id = ibm_security_group.master_sg.id
}