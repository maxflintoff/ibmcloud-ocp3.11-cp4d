provider "ibm" {
    ibmcloud_api_key = var.ibmcloud_api_key
    iaas_classic_username = var.iaas_classic_username
    iaas_classic_api_key = var.iaas_classic_api_key
    region = var.region
    generation = var.generation
}

locals {
    cluster_domain = join(".", [ var.cluster_name, var.domain ] )
    ssh_keys = concat([
        for key in data.ibm_compute_ssh_key.ssh_key: key.id
    ],
    [
        ibm_compute_ssh_key.cluster_ssh_key.id
    ])
}

data "ibm_compute_ssh_key" "ssh_key" {
    count = length(var.ssh_key)
    label = var.ssh_key[count.index]
}

resource "tls_private_key" "new_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "ibm_compute_ssh_key" "cluster_ssh_key" {
    label = local.cluster_domain
    public_key = tls_private_key.new_ssh_key.public_key_openssh
    tags = var.tags
}


module "master" {
    source = "./modules/master_node"

    hostnames = var.master_name
    domain = local.cluster_domain
    qty = var.master_qty
    flavor = var.master_flavor
    os = var.os_reference
    datacenter = var.datacenter
    ssh_id = local.ssh_keys
    tags = var.tags
}

module "worker" {
    source = "./modules/worker_node"

    hostnames = var.worker_name
    domain = local.cluster_domain
    qty = var.worker_qty
    flavor = var.worker_flavor
    os = var.os_reference
    datacenter = var.datacenter
    ssh_id = local.ssh_keys
    tags = var.tags
    master_sg = module.master.master_sg_id
}

module "install" {
    source = "./modules/install_node"

    hostnames = var.master_name
    domain = local.cluster_domain
    qty = var.master_qty
    flavor = var.installer_flavor
    os = var.os_reference
    datacenter = var.datacenter
    ssh_id = local.ssh_keys
    tags = var.tags
}

data "ibm_dns_domain" "domain" {
    name = var.domain
}