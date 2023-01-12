output "instance_ip_addr" {
    value = {
        for k, instance in scaleway_instance_server.server
    }
}