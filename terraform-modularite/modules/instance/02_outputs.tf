output "server_id" {
  description = "L'Id de l'instance créée par le module instance"
  value       = scaleway_instance_server.server.id
}

output "public_ip" {
  description = "L'Ip publique créée par le module instance"
  value       = scaleway_instance_server.server.public_ip
}