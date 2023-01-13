output "private_netwotk_id" {
    value = scaleway_vpc_private_network.private_network.id
}

output "public_ip_ese1_id" {
    value = scaleway_instance_ip.public_ip_ese1.id
}

output "public_ip_ese2_id" {
    value = scaleway_instance_ip.public_ip_ese2.id
}

output "public_ip_ese3_id" {
    value = scaleway_instance_ip.public_ip_ese3.id
}

output "public_ip_app_id" {
    value = scaleway_instance_ip.public_ip_app.id
}

output "ese_sg_id" {
    value = scaleway_instance_security_group.ese_sg.id
}

output "app_sg_id" {
    value = scaleway_instance_security_group.app_sg.id
}