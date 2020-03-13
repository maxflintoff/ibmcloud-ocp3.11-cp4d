data "ibm_dns_domain" "main" {
    name = var.domain
}

resource "ibm_dns_record" "cloudapps" {
    data = var.master_ip
    domain_id = data.ibm_dns_domain.main.id
    host = "*.cloudapps.${var.cluster_domain}"
    ttl = 300
    type = "a"
}