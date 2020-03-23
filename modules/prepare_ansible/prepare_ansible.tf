resource "local_file" "inventory" {
  content  = <<EOT
[ocp_masters]
${var.master.public_ip}

[ocp_workers]
%{for worker in var.workers}${worker.public_ip}
%{endfor}
[installer]
${var.installer.public_ip}
EOT
  filename = "${path.root}/installer_files/inventory"
}

resource "local_file" "inventory_vars" {
  content  = <<EOT
ansible_ssh_private_key_file: ${path.root}/installer_files/id_rsa
rh_user: ${var.rh_user}
rh_pass: ${var.rh_pass}
pool_id: ${var.pool_id}
master: ${jsonencode(var.master)}
workers: ${jsonencode(var.workers)}
installer: ${jsonencode(var.installer)}
cluster_domain: ${var.cluster_domain}
EOT
  filename = "${path.root}/installer_files/group_vars/all.yaml"
}

resource "local_file" "ssh_key" {
  content         = var.ssh_key.private_key_pem
  filename        = "${path.root}/installer_files/id_rsa"
  file_permission = 0400
}

resource "local_file" "ssh_key_public" {
  content  = var.ssh_key.public_key_openssh
  filename = "${path.root}/installer_files/id_rsa.pub"
}