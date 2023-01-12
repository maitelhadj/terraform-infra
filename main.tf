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

resource "scaleway_instance_security_group" "worker_sg" {
  name = "${var.prefix}-worker-security-group"

  inbound_default_policy  = "drop" # By default we drop incoming traffic that do not match any inbound_rule
  outbound_default_policy = "drop"

  inbound_rule {
    action = "accept"
    port   = 22
  }

  outbound_rule {
    action = "accept"
    port   = 22
  }
}

resource "scaleway_instance_security_group" "master_sg" {
  name = "${var.prefix}-master-security-group"

  inbound_default_policy  = "drop" # By default we drop incoming traffic that do not match any inbound_rule
  outbound_default_policy = "drop"

  inbound_rule {
    action = "accept"
    port   = 22
  }

  outbound_rule {
    action = "accept"
    port   = 22
  }

  outbound_rule {
    action = "accept"
    port   = 5601
  }

  outbound_rule {
    action = "accept"
    port   = 3000
  }
  
  outbound_rule {
    action = "accept"
    port   = 9090
  }
}

resource "scaleway_instance_volume" "server_volume" {
  count      = var.instance_count
  type       = "b_ssd"
  name       = "${var.prefix}-volume-${count.index}"
  size_in_gb = 30
}

resource "scaleway_iam_ssh_key" "main" {
  name       = "main"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL1pGDlh6snyh8QpNDuOrthJ8tqFj6FoI4tNI6PlP69I mayas.aitelhadj@ynov.com"
}

resource "scaleway_instance_server" "server" {
  count = var.instance_count

  name  = "${var.prefix}-${count.index}"
  type  = count.index < var.instance_master_count ? var.instance_master_type : var.instance_worker_type
  image = count.index < var.instance_master_count ? var.instance_master_image : var.instance_worker_image
  ip_id = scaleway_instance_ip.public_ip[count.index].id
  
  additional_volume_ids = [scaleway_instance_volume.server_volume[count.index].id]

  security_group_id = count.index < var.instance_master_count ? scaleway_instance_security_group.master_sg.id : scaleway_instance_security_group.worker_sg.id

  private_network {
    pn_id = scaleway_vpc_private_network.private_network.id
  }

#   connection {
#     type     = "ssh"
#     user     = "root"
#     host     = self.public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "curl -fsSL https://get.docker.com -o get-docker.sh",
#       "sh get-docker.sh",
#       "rm get-docker.sh"
#     ]
#  }
}