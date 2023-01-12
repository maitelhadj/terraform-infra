variable "prefix" {
    description = "Prefix"
    type        = string
}

variable "instances" {
    description = "Instances à créer"
    type        = list(object({
        type = string
        image = string
    }))
}