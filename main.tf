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
  count = var.instance_count

  name = "${var.prefix}-${count.index}"
  type = count.index <= var.no_of_master ? var.instance_master_type : var.instance_worker_type
  image = var.instance_type
  ip_id = public_ip.ip_id
}