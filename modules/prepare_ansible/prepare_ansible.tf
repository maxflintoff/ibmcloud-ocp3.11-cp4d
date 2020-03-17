resource "local_file" "inventory" {
    content = <<EOT
[ocp_masters]
%{ for master in var.masters }${master.public_ip}
%{ endfor }
[ocp_workers]
%{ for worker in var.workers }${worker.public_ip}
%{ endfor }
[installer]
${var.installer.public_ip}
[OSEv3:children]
masters
nodes
etcd

[OSEv3:vars]
openshift_deployment_type=openshift-enterprise
ansible_ssh_user=root
oreg_auth_user=${var.rh_user}
oreg_auth_password=${var.rh_pass}
openshift_master_default_subdomain=apps.${var.cluster_domain}
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider'}]
openshift_master_htpasswd_users={'ocpadmin': '$apr1$AeLdhIiN$VTRD43OglLcEyH7bOVXPP0'} #Ch4ngeM3
openshift_node_set_node_ip=true

[nodes:children]
masters
compute

[masters]
%{ for master in var.masters }${master.public_ip} openshift_public_hostname=${master.name}.${var.cluster_domain} openshift_ip=${master.private_ip} openshift_node_group_name='node-config-master-infra' %{ endfor }

[etcd]
%{ for master in var.masters }${master.public_ip} %{ endfor }

[compute]
%{ for worker in var.workers }${worker.public_ip} openshift_public_hostname=${worker.name}.${var.cluster_domain} openshift_ip=${worker.private_ip} openshift_node_group_name='node-config-compute'
%{ endfor }
EOT
    filename = "${path.root}/installer_files/inventory"
}

resource "local_file" "inventory_vars" {
    content = <<EOT
ansible_ssh_private_key_file: ${path.root}/installer_files/id_rsa
rh_user: ${var.rh_user}
rh_pass: ${var.rh_pass}
pool_id: ${var.pool_id}
masters: ${jsonencode(var.masters)}
workers: ${jsonencode(var.workers)}
installer: ${jsonencode(var.installer)}
cluster_domain: ${var.cluster_domain}
EOT
    filename = "${path.root}/installer_files/group_vars/all.yaml"
}

resource "local_file" "ssh_key" {
    content = var.ssh_key.private_key_pem
    filename = "${path.root}/installer_files/id_rsa"
    file_permission = 0400
}

resource "local_file" "ssh_key_public" {
    content = var.ssh_key.public_key_openssh
    filename = "${path.root}/installer_files/id_rsa.pub"
}