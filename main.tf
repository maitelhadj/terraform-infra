terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.8.0"
    }
  }
  required_version = "~> 1.3.0"
}

resource "scaleway_vpc_private_network" "private_network" {
  name = "${var.prefix}-private-network"
}

resource "scaleway_instance_ip" "public_ip" {
  count = 4
}

resource "scaleway_instance_server" "server" {
  for_each = toset(scaleway_instance_ip.public_ip)

  name = "${var.configuration.name}-${index(toset(scaleway_instance_ip.public_ip), each.value) + 1}"
  type = var.configuration.type
  image = "${index(scaleway_instance_ip.public_ip, each.value) + 1}" <= var.configuration.no_of_master ? var.configuration.type_of_master : var.configuration.type_of_worker
  ip_id = each.value.ip_id
}