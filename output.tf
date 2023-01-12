output "instance_ip_addr" {
    value = {
        for instance in scaleway_instance_server.server : instance.name => instance.private_ip
    }
}