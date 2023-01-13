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

variable "ip_id" {
    description = "Ip ids"
    type = object({
        ese1 = string
        ese2 = string
        ese3 = string
        app  = string
    })
}

variable "sg" {
    description = "Security group ids"
    type = object({
        ese = string
        app = string
    })
}