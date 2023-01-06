terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.8.0"
    }
  }
  required_version = "~> 1.3.0"
}

variable "prefix" {
    description = "Prefix value for all resources"
    type        = string
    default     = "MAI"
    
    validation {
        condition     = length(var.prefix) == 3
        error_message = "3 characters are required"
    }
}

resource "scaleway_vpc_private_network" "pn" {
    name = "${var.prefix}-private-network"
}