variable "ssh_private_key" {
    type = string
}

variable "server_id" {
    type = string
}

variable "public_ip" {
    type = string
}

variable "install_docker_script" {
    type = list(string)
}