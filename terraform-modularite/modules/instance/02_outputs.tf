output "server_ese1_id" {
    value = scaleway_instance_server.server_ese1.id
}

output "server_ese2_id" {
    value = scaleway_instance_server.server_ese2.id
}

output "server_ese3_id" {
    value = scaleway_instance_server.server_ese3.id
}

output "server_app_id" {
    value = scaleway_instance_server.server_app.id
}

output "host_ese1" {
    value = scaleway_instance_server.server_ese1.public_ip
}

output "host_ese2" {
    value = scaleway_instance_server.server_ese2.public_ip
}

output "host_ese3" {
    value = scaleway_instance_server.server_ese3.public_ip
}

output "host_app" {
    value = scaleway_instance_server.server_app.public_ip
}