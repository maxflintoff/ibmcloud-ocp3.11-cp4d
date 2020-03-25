data "ibm_dns_domain" "main" {
  name = var.domain
}

resource "ibm_dns_record" "apps" {
  data      = var.master.ipv4_address
  domain_id = data.ibm_dns_domain.main.id
  host      = "*.apps.${var.cluster_name}"
  ttl       = 300
  type      = "a"
}

resource "ibm_dns_record" "master" {

  data      = var.master.ipv4_address
  domain_id = data.ibm_dns_domain.main.id
  host      = "${var.master.hostname}.${var.cluster_name}"
  ttl       = 300
  type      = "a"
}