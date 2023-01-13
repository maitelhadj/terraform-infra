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

    prefix = var.prefix
    port   = var.port
    ssh_public_key = var.ssh_public_key
}

module "instance_module" {
    source   = "./modules/instance"

    prefix   = var.prefix
    instance = var.instance
    
    private_network_id = module.network_module.private_netwotk_id

    ip_id = {
      ese1 = module.network_module.public_ip_ese1_id
      ese2 = module.network_module.public_ip_ese2_id
      ese3 = module.network_module.public_ip_ese3_id
      app  = module.network_module.public_ip_app_id
    }
    
    sg = {
      ese = module.network_module.ese_sg_id
      app = module.network_module.app_sg_id
    }

    depends_on = [module.network_module]
}

module "provision_module" {
  source = "./modules/provision"

  ssh_private_key = var.ssh_private_key

  server_ese1_id = module.instance_module.server_ese1_id
  server_ese2_id = module.instance_module.server_ese2_id
  server_ese3_id = module.instance_module.server_ese3_id
  server_app_id = module.instance_module.server_app_id

  public_ip_ese1 = module.instance_module.public_ip_ese1
  public_ip_ese2 = module.instance_module.public_ip_ese2
  public_ip_ese3 = module.instance_module.public_ip_ese3
  public_ip_app = module.instance_module.public_ip_app

  install_docker_script = var.install_docker_script
}