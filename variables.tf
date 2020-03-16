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

variable "ssh_key" {
    type = list(string)
    default = []
}

variable "domain" {
    type = string
}

variable "region" {
    type = string
    default = "eu-gb"
}

variable "cluster_name" {
    type = string
    default = "cluster"
}

variable "datacenter" {
    type = string
    default = "lon02"
}

# these can be viewed with this command "ibmcloud sl vs options"
variable "os_reference" {
    type = string
    default = "REDHAT_7_64"
}

variable "installer_os_reference" {
    type = string
    default = "CENTOS_7_64"
}

variable "master_qty" {
    type = number
    default = 1
}

variable "master_name" {
    type = list(string)
    default = [
        "master"
    ]
}

variable "tags" {
    type = list(string)
    default = []
}

variable "master_flavor" {
    type = string
    default = "B1_8X32X25"
}

variable "worker_qty" {
    type = number
    default = 3
}

variable "worker_name" {
    type = list(string)
    default = [
        "worker1", "worker2", "worker3"
    ]
}

variable "worker_flavor" {
    type = string
    default = "B1_16X64X25"
}

variable "resource_group_name" {
    type = string
    default = "ocp-resources"
}

variable "generation" {
    type = string
    default = "1"
}

variable "installer_flavor" {
    type = string
    default = "B1_2X8X100"
}

variable "openshift_password" {
    type = string
    default = "Ch4ngeM3"
}