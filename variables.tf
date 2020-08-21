variable "ibmcloud_api_key" {
  type = string
}

variable "iaas_classic_username" {
  type = string
}

variable "iaas_classic_api_key" {
  type = string
}

variable "redhat_un" {
  type = string
}

variable "redhat_pw" {
  type = string
}

variable "openshift_pool_id" {
  type = string
}

variable "domain" {
  type = string
}

variable "ssh_key" {
  type    = list(string)
  default = []
}

variable "region" {
  type    = string
  default = "eu-gb"
}

variable "cluster_name" {
  type    = string
  default = "cluster"
}

variable "datacenter" {
  type    = string
  default = "lon02"
}

# these can be viewed with this command "ibmcloud sl vs options"
variable "os_reference" {
  type    = string
  default = "REDHAT_7_64"
}

variable "installer_os_reference" {
  type    = string
  default = "CENTOS_7_64"
}

variable "master_qty" {
  type    = number
  default = 3
}

variable "master_name" {
  type = list(string)
  default = [
    "master1", "master2", "master3"
  ]
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "master_flavor" {
  type    = string
  default = "B1_8X32X100"
}

variable "compute_qty" {
  type    = number
  default = 3
}

variable "compute_name" {
  type = list(string)
  default = [
    "compute1", "compute2", "compute3"
  ]
}

variable "compute_flavor" {
  type    = string
  default = "B1_32X64X100"
}

variable "resource_group_name" {
  type    = string
  default = "ocp-resources"
}

variable "generation" {
  type    = string
  default = "1"
}

variable "installer_flavor" {
  type    = string
  default = "B1_2X8X100"
}

variable "openshift_password" {
  type    = string
  default = "Ch4ngeM3"
}

variable "infra_name" {
  type    = string
  default = "infra"
}

variable "infra_flavor" {
  type    = string
  default = "B1_2X8X100"
}

variable "wsl_install" {
  type    = string
  default = false
}

variable "wkc_install" {
  type    = string
  default = false
}

variable "wkc_patch" {
  type    = string
  default = false
}

variable "namespace" {
  type    = string
  default = "zen"
}