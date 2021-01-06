terraform {
  required_providers {
    ibm = {
      source = "registry.terraform.io/ibm-cloud/ibm"
      version = "~> 1.18.0"
    }
    tls = {
      source = "registry.terraform.io/hashicorp/tls"
      version = "~> 3.0.0"
    }
  }
  required_version = "~> 0.14.3"
}
