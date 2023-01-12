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
  count = var.instance_count
}

resource "scaleway_instance_security_group" "ssh" {
  inbound_default_policy = "drop" # By default we drop incoming traffic that do not match any inbound_rule

  inbound_rule {
    action = "accept"
    port   = 22
  }
}

resource "scaleway_instance_volume" "server_volume" {
  count      = var.instance_count
  type       = "l_ssd"
  name       = "${var.prefix}-volume-${count.index}"
  size_in_gb = 30
}

resource "scaleway_instance_server" "server" {
  count = var.instance_count

  name  = "${var.prefix}-${count.index}"
  type  = count.index < var.instance_master_count ? var.instance_master_type : var.instance_worker_type
  image = count.index < var.instance_master_count ? var.instance_master_image : var.instance_worker_image
  ip_id = scaleway_instance_ip.public_ip[count.index].id

  security_group_id = scaleway_instance_security_group.ssh.id

  private_network {
    pn_id = scaleway_vpc_private_network.private_network.id
  }

  additional_volume_ids = scaleway_instance_volume.server_volume[count.index].id
}