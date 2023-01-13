terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

module "network_module" {
    source = "./modules/network"
}

module "instance_module" {
    source = "./modules/instance"
}