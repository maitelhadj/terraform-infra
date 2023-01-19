variable "prefix" {
  description = "Prefix des ressources"
  type        = string
}

variable "ssh_public_key" {
  type = string
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