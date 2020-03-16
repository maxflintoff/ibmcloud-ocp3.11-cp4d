data "ibm_dns_domain" "main" {
    name = var.domain
}

resource "ibm_dns_record" "apps" {
    data = var.master[0].ipv4_address
    domain_id = data.ibm_dns_domain.main.id
    host = "*.apps.${var.cluster_name}"
    ttl = 300
    type = "a"
}

resource "ibm_dns_record" "master" {
    count = length(var.master)

    data = var.master[count.index].ipv4_address
    domain_id = data.ibm_dns_domain.main.id
    host = "${var.master[count.index].hostname}.${var.cluster_name}"
    ttl = 300
    type = "a"
}