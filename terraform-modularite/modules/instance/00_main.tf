resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "volume" {
  name       = "${var.prefix}-volume"
  type       = "b_ssd"
  size_in_gb = 30
}

resource "scaleway_instance_server" "server" {
  name  = "${var.prefix}-${var.name}"
  
  type  = var.type
  image = var.image
  
  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [scaleway_instance_volume.volume.id]

  private_network {
    pn_id = var.private_network_id
  }

  security_group_id = var.sg
}