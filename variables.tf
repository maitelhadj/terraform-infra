variable "prefix" {
    description = "Prefix value for all resources"
    type        = string
    default     = "mai"
    
    validation {
        condition     = length(var.prefix) == 3
        error_message = "3 characters are required"
    }
}

variable "master" {
    description = "Informations relatives aux instances masters à créer"
    default = {}
}

variable "worker" {
    description = "Informations relatives aux instances workers à créer"
    default = {}
}