output "private_netwotk_id" {
    value = scaleway_vpc_private_network.private_network.id
}

output "ese_sg_id" {
    value = scaleway_instance_security_group.ese_sg.id
}

output "app_sg_id" {
    value = scaleway_instance_security_group.app_sg.id
}