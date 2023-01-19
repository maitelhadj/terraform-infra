variable "prefix" {
    description = "Prefix des ressources"
    type        = string
    default     = "mayas"
}

variable "ssh_public_key" {
    type = string
}

variable "port" {
    description = "Liste des ports à exposer"
    type        = map(number)
    default = {
        grafana = 3000
        kibana = 5601
        prometheus = 9090
        ssh = 22
    }
}