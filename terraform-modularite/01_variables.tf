variable "prefix" {
  description = "Prefix des ressources"
  type        = string
}

variable "port" {
  description = "Liste des ports à exposer"
  type = object({
    ssh        = number
    kibana     = number
    grafana    = number
    prometheus = number
  })
}

variable "install_docker_script" {
  description = "Script d'install Docker"
  type        = list(string)
}

variable "ssh_public_key_path" {
  description = "SSH Public key path"
  type        = string
}

variable "ssh_private_key_path" {
  description = "SSH Private key path"
  type        = string
}

variable "instances" {
  description = "Map of instance to create"
  type = map(object({
    name  = string
    type  = string
    image = string
  }))
}