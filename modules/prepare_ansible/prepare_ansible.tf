resource "local_file" "inventory" {
    content = <<EOT
all:
  children:
    masters:
      hosts:
        %{ for master in var.masters }${master}:
        %{ endfor }
    workers:
      hosts:
        %{ for worker in var.workers }${worker}:
        %{ endfor }
    installer:
      hosts:
        ${var.installer}
  vars:
    ansible_ssh_private_key_file: ${path.root}/installer_files/id_rsa
    rh_user: ${var.rh_user}
    rh_pass: ${var.rh_pass}
    pool_id: ${var.pool_id}
    masters: ${jsonencode(var.master_private)}
    workers: ${jsonencode(var.worker_private)}
    installer: ${jsonencode(var.installer_private)}
    cluster_domain: ${var.cluster_domain}
EOT
    filename = "${path.root}/installer_files/inventory.yaml"
}

resource "local_file" "ssh_key" {
    content = var.ssh_key.private_key_pem
    filename = "${path.root}/installer_files/id_rsa"
    file_permission = 0400
}