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
  count = 4
  
  source = "./modules/network"
  
  ssh_public_key = file(var.ssh_public_key_path)
  
  prefix = var.prefix
  port   = var.port
}

module "instance_module" {
  count = 4

  source   = "./modules/instance"

  prefix   = var.prefix
  name     = "server-ese1"
  type     = "DEV1-S"
  image    = "ubuntu_focal"
  
  private_network_id = module.network_module.private_netwotk_id
  ip_id = module.network_module.public_ip_id
  sg = count.index < 1 ? module.network_module.app_sg_id : module.network_module.app_sg_id

  depends_on = [module.network_module]
}

module "provision_module" {
  count = 4

  source = "./modules/provision"

  ssh_private_key = file(var.ssh_private_key_path)

  server_id = module.instance_module.server_id
  public_ip = module.instance_module.public_ip

  install_docker_script = var.install_docker_script
}