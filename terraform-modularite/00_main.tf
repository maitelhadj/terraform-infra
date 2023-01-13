terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

# Un module n'est qu'un bout de recette, par exemple je peux créer un module dans lequel je vais déployer plusieurs ressources
# tel que : une public_ip, une instance...
#
# On fait un appel au module network dans notre recette principale :
#   - source est le chemin vers le module que je souhaite utiliser (on va y retrouver les fichiers classique d'une recette terraform, un main.tf, un variables.tf et outputs.tf)
#   - les arguments "prefix" et "port" sont des variables qui sont déclarées dans le fichier "modules/network/01_variables.tf" et que je peux initialiser directement dans ce bloc module
# 
# Si je fais un terraform apply sur cette recette (le main dans lequel on se trouve), ce dernier va faire un appel au module network et appliquer la recette que tu auras défini dans ce module
module "network_module" {  
  source = "./modules/network"
  
  ssh_public_key = file(var.ssh_public_key_path)
  
  prefix = var.prefix
  port   = var.port
}

# Ici toujours un module <==
# La particularité est que j'utilise un for_each pour pouvoir appeler ce module plusieurs fois
# 
# De plus, on note l'utilisation de la syntaxe "module.network_module.app_sg_id". Cela me permet de récupérer une information d'un autre module.
# En l'occurence, j'accède au module "network_module" créé précédemment, en particulier, j'accède à l'output "app_sg_id" que j'ai créé ici => ""./modules/network/02_outputs.tf"
# C'est ainsi que l'on peut transférer des valeurs d'un module à un autre.
#
# Grosso modo, les variables sont les "inputs", le main est le "processor" et outputs n'est rien d'autre que les "outputs"
# 
# Petit lien vers la doc : https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
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

# Ici toujours un module <==
# Ce module deploie docker sur les instance créées précédemment
module "provision_module" {
  for_each = module.instance_module

  source = "./modules/provision"

  ssh_private_key = file(var.ssh_private_key_path)

  server_id = each.value.server_id
  public_ip = each.value.public_ip

  install_docker_script = var.install_docker_script
}