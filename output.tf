output "instance_ip_addr" {
    for_each = [{
        for k, instance in scaleway_instance_server.server : k => instance.private_ip
    },
    {
        for k, instance in scaleway_instance_server.server : k => instance.public_ip
    }]

    value = "${each.key} = ${each.value}"
}