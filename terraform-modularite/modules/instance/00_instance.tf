terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

# resource "scaleway_instance_server" "ese1_server" {
#   name  = "${var.prefix}-ese-1"
#   type  = 
#   image = count.index < var.instance_master_count ? var.instance_master_image : var.instance_worker_image
#   ip_id = scaleway_instance_ip.public_ip[count.index].id

#   additional_volume_ids = [scaleway_instance_volume.server_volume[count.index].id]

#   security_group_id = count.index < var.instance_master_count ? scaleway_instance_security_group.master_sg.id : scaleway_instance_security_group.worker_sg.id

#   private_network {
#     pn_id = scaleway_vpc_private_network.private_network.id
#   }
# }