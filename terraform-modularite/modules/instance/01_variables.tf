variable "prefix" {
  description = "Prefix des ressources"
  type        = string
}

variable "name" {
  description = "Server name"
  type        = string
}

variable "type" {
  description = "Server type"
  type        = string
}

variable "image" {
  description = "Server image"
  type        = string
}

variable "sg" {
  description = "Security group"
  type        = string
}

variable "private_network_id" {
  description = "Private network id"
  type        = string
}