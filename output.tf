output "instance_ip_addr" {
    description = "Instance's private IP"

    value = {
        for instance in scaleway_instance_server.server : instance.name => instance.private_ip
    }
}