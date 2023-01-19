output "private_netwotk_id" {
  description = "L'Id du VPC Private Network créé par le module network"
  value       = scaleway_vpc_private_network.private_network.id
}

output "ese_sg_id" {
  description = "L'Id du security group des instances Elasticsearch"
  value       = scaleway_instance_security_group.ese_sg.id
}

output "app_sg_id" {
  description = "L'Id du security group des instances Applicative"
  value       = scaleway_instance_security_group.app_sg.id
}