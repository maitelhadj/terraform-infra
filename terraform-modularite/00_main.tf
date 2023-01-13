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