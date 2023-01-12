output "instance_public_ip_addr" {
    description = "Instance's public IP"

    value = {
        for instance in scaleway_instance_server.server : instance.name => instance.public_ip
    }
}

output "instance_private_ip_addr" {
    description = "Instance's private IP"

    value = {
        for instance in scaleway_instance_server.server : instance.name => instance.private_ip
    }
}