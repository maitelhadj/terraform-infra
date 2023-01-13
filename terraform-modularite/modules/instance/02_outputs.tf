output "server" {
    value = scaleway_instance_server.server.id
}

output "public_ip_ese1" {
    value = scaleway_instance_server.server.public_ip
}