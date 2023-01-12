variable "prefix" {
    description = "Prefix value for all resources"
    type        = string
    default     = "mayas"
}

variable "instance_count" {
    default = "4"
}

variable "no_of_master" {
    default = "1"  
}

variable "instance_worker_type" {
    default = "DEV1-S"
}

variable "instance_master_type" {
    default = "DEV1-XL"
}

variable "instance_type" {
    default = "ubuntu_focal"
}