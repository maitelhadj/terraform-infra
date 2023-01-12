output "instance_ip_addr" {
    count = var.instance_count
    value = "\nServeur ${scaleway_instance_server[count.index].name} :\n\tPrivate IP : ${scaleway_instance_server[count.index].private_ip}\n\tPublic IP : ${scaleway_instance_server[count.index].public_ip}\n"
}