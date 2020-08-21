data "ibm_dns_domain" "main" {
  name = var.domain
}

locals {
  infra_count = var.master_qty > 1 ? 1 : 0
}

resource "ibm_dns_record" "apps" {

  count = local.infra_count == 0 ? 1 : 0

  data      = var.master[0].ipv4_address
  domain_id = data.ibm_dns_domain.main.id
  host      = "*.apps.${var.cluster_name}"
  ttl       = 300
  type      = "a"
}

resource "ibm_dns_record" "apps_infra" {

  count = local.infra_count == 1 ? 1 : 0

  data      = var.infra[0].ipv4_address
  domain_id = data.ibm_dns_domain.main.id
  host      = "*.apps.${var.cluster_name}"
  ttl       = 300
  type      = "a"
}

resource "ibm_dns_record" "infra" {

  count = local.infra_count == 1 ? 1 : 0

  data      = var.infra[count.index].ipv4_address
  domain_id = data.ibm_dns_domain.main.id
  host      = "${var.infra[count.index].hostname}.${var.cluster_name}"
  ttl       = 300
  type      = "a"
}

resource "ibm_dns_record" "master" {

  count = var.master_qty

  data      = var.master[count.index].ipv4_address
  domain_id = data.ibm_dns_domain.main.id
  host      = "${var.master[count.index].hostname}.${var.cluster_name}"
  ttl       = 300
  type      = "a"
}