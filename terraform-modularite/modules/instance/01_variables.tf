variable "prefix" {
    description = "Prefix des ressources"
    type        = string
    default     = "mayas"
}

variable "name" {
    description = "Server name"
    type = string
}

variable "ip_id" {
    description = "Public IP"
    type = string
}

variable "sg" {
    description = "Security group"
    type = string
}

variable "private_network_id" {
    description = "Private network id"
    type = string
}