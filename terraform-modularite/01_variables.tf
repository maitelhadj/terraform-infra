variable "prefix" {
    description = "Prefix des ressources"
    type        = string
    default     = "mayas"
}

variable "instance" {
    description = "Configuration des instances"
    type        = object({
        ese = object({
            type    = string
            image   = string
        })

        app = object({
            type    = string
            image   = string
        })
    })
    default = {
        app = {
            image = "ubuntu_focal"
            type = "DEV1-XL"
        }
        ese = {
            image = "ubuntu_focal"
            type = "DEV1-S"
        }
    }
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
    default = [
        "curl -fsSL https://get.docker.com -o get-docker.sh",
        "sh get-docker.sh",
        "rm get-docker.sh"
    ]
}

variable "ssh_public_key" {
    description = "SSH Public key"
    type = string
}

variable "ssh_private_key" {
    description = "SSH Private key"
    type = string
}