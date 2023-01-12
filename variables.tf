variable "prefix" {
    description = "Prefix value for all resources"
    type        = string
    default     = "mayas"
}

variable "instance_count" {
    description = "Nombre d'instances à créer"
    type = string
    default = "4"
}

variable "instance_master_count" {
    description = "Nombre d'instances master à créer"
    type = string
    default = "1"  
}

variable "instance_worker_type" {
    description = "Type d'instance worker à créer"
    type = string
    default = "DEV1-S"
}

variable "instance_master_type" {
    description = "Type d'instance master à créer"
    type = string
    default = "DEV1-XL"
}

variable "instance_worker_image" {
    description = "Image des instance worker à créer"
    type = string
    default = "ubuntu_focal"
}

variable "instance_master_image" {
    description = "Image des instances master à créer"
    type = string
    default = "ubuntu_focal"
}