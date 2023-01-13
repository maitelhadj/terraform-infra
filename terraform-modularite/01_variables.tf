variable "prefix" {
    description = "Prefix des ressources"
    type        = string
    default     = "mayas"
}

variable "port" {
    description = "Liste des ports à exposer"
    type        = object({
        ssh         = number
        kibana      = number
        grafana     = number
        prometheus  = number
    })
    default = {
        grafana = 3000
        kibana = 5601
        prometheus = 9090
        ssh = 22
    }
}

variable "install_docker_script" {
    description = "Script d'install Docker"
    type = list(string)
}

variable "ssh_public_key_path" {
    description = "SSH Public key path"
    type = string
}

variable "ssh_private_key_path" {
    description = "SSH Private key path"
    type = string
}