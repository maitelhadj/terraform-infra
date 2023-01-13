terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

resource "scaleway_instance_volume" "volume_ese1" {
  name       = "${var.prefix}-volume-ese-1"
  type       = "b_ssd"
  size_in_gb = 30
}

resource "scaleway_instance_volume" "volume_ese2" {
  name       = "${var.prefix}-volume-ese-2"
  type       = "b_ssd"
  size_in_gb = 30
}

resource "scaleway_instance_volume" "volume_ese3" {
  name       = "${var.prefix}-volume-ese-3"
  type       = "b_ssd"
  size_in_gb = 30
}

resource "scaleway_instance_volume" "volume_app" {
  name       = "${var.prefix}-volume-app"
  type       = "b_ssd"
  size_in_gb = 30
}

resource "scaleway_instance_server" "server_ese1" {
  name  = "${var.prefix}-server-ese-1"
  
  type  = var.instance.ese.type
  image = var.instance.ese.image
  
  ip_id = scaleway_instance_ip.public_ip_ese1.id

  additional_volume_ids = [scaleway_instance_volume.volume_ese1.id]

  private_network {
    pn_id = scaleway_vpc_private_network.private_network.id
  }

  security_group_id = scaleway_instance_security_group.ese_sg.id
}

resource "scaleway_instance_server" "server_ese2" {
  name  = "${var.prefix}-server-ese-2"
  
  type  = var.instance.ese.type
  image = var.instance.ese.image
  
  ip_id = scaleway_instance_ip.public_ip_ese2.id

  additional_volume_ids = [scaleway_instance_volume.volume_ese2.id]

  private_network {
    pn_id = scaleway_vpc_private_network.private_network.id
  }

  security_group_id = scaleway_instance_security_group.ese_sg.id
}

resource "scaleway_instance_server" "server_ese3" {
  name  = "${var.prefix}-server-ese-3"
  
  type  = var.instance.ese.type
  image = var.instance.ese.image
  
  ip_id = scaleway_instance_ip.public_ip_ese3.id

  additional_volume_ids = [scaleway_instance_volume.volume_ese3.id]

  private_network {
    pn_id = scaleway_vpc_private_network.private_network.id
  }

  security_group_id = scaleway_instance_security_group.ese_sg.id
}

resource "scaleway_instance_server" "server_app" {
  name  = "${var.prefix}-app"
  
  type  = var.instance.ese.type
  image = var.instance.ese.image
  
  ip_id = scaleway_instance_ip.public_ip_app.id

  additional_volume_ids = [scaleway_instance_volume.volume_app.id]

  private_network {
    pn_id = scaleway_vpc_private_network.private_network.id
  }

  security_group_id = scaleway_instance_security_group.ese_sg.id
}