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
  
  ssh_public_key = file(var.ssh_public_key_path)
  
  prefix = var.prefix
  port   = var.port
}

module "instance_module" {
  for_each = var.instances

  source   = "./modules/instance"

  prefix   = var.prefix
  name     = each.value.name
  type     = each.value.type
  image    = each.value.image
  
  private_network_id = module.network_module.private_netwotk_id
  sg = each.key == "app" ? module.network_module.app_sg_id : module.network_module.app_sg_id

  depends_on = [module.network_module]
}

module "provision_module" {
  for_each = module.instance_module

  source = "./modules/provision"

  ssh_private_key = file(var.ssh_private_key_path)

  server_id = each.value.server_id
  public_ip = each.value.public_ip

  install_docker_script = var.install_docker_script
}