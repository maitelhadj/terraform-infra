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
  count = 3
}

resource "scaleway_instance_server" "server" {
  for_each = scaleway_instance_ip.public_ip

  name = "${var.worker.name}-${index(scaleway_instance_ip.public_ip, each.value) + 1}"
  type = var.worker.type
  image = var.worker.image
  ip_id = each.value.ip_id
}