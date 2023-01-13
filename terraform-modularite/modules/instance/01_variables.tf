variable "prefix" {
    description = "Prefix des ressources"
    type        = string
    default     = "mayas"
}

variable "test" {
    type = object({
        type    = string
        image   = string
    })
}

variable "instance" {
    description = "Configuration des instances"
    type        = object({
        ese = test
        app = test
    })
}